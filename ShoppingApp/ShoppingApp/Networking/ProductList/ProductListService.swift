//
//  ProductListService.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

protocol ProductListServiceInterface {

    init (urlString: String)

    func getProductList(handler: @escaping (Result<ProductListModel, ShoppingAppError>) -> Void)
}

class ProductListService: ProductListServiceInterface {
    let urlString: String

    required public init(urlString: String ) {
        self.urlString = urlString
    }

    func getProductList(handler: @escaping (Result<ProductListModel, ShoppingAppError>) -> Void) {
        guard let url = URL(string: "\(urlString)") else {
            handler(.failure(ShoppingAppError.NotFound))
            return
        }

        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(ShoppingAppError.BadRequest))
                case 404:
                    handler(.failure(ShoppingAppError.NotFound))
                case 500:
                    handler(.failure(ShoppingAppError.InternalServerError))
                default:
                    handler(.failure(ShoppingAppError.InternalServerError))
                }
            }

            guard let data = data else {
                if let error = error {
                    handler(.failure(ShoppingAppError.GenericError(message: error.localizedDescription)))
                }
                //add errors
                return
            }


            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(ProductListModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(ShoppingAppError.WrongData))
            }
        }
        task.resume()
    }
}
