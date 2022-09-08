//
//  ShoppingAppError.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

public enum  ShoppingAppError: Error {
    case NotFound
    case WrongData
    case InternalServerError
    case BadRequest
    case GenericError(message: String)
}

extension ShoppingAppError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .NotFound:
            return "Server host provided is not found"
        case .BadRequest:
            return "A bad request sent to the instance"
        case .WrongData:
            return "Data couldn't be decoded as it's in wrong format"
        case .InternalServerError:
            return "Internal server error"
        case .GenericError(let message):
            return message
        }
    }
}


extension ShoppingAppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NotFound:
            return "Server host provided is not found"
        case .BadRequest:
            return "A bad request sent to the instance"
        case .WrongData:
            return "Data couldn't be decoded as it's in wrong format"
        case .InternalServerError:
            return "Internal server error"
        case .GenericError(let message):
            return message
        }
    }
}
