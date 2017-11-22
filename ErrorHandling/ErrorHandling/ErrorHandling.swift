//
//  ErrorHandling.swift
//  ErrorHandling
//
//  Created by Kapil Rathore on 17/11/17.
//  Copyright © 2017 Kapil Rathore. All rights reserved.
//

import UIKit

protocol AppError: Error {
    var title: String { get }
    var description: String { get }
    var image: UIImage { get }
}

enum APIError: AppError {
    
    case invalidToken
    case serverError
    case custom(error: String)
    
    var title: String {
        return "ERROR !"
    }
    
    var description: String {
        
        switch self {
        case .invalidToken:
            return "Invalid token. Please login again."
        case .serverError:
            return "Data could not be loaded. Please try again"
        case .custom(let error):
            return error
        }
    }
    
    var image: UIImage {
        
        switch self {
        case .invalidToken:
            return UIImage(named: "tokenError")!
        case .serverError:
            return UIImage(named: "serverError")!
        case .custom(_):
            return UIImage(named: "customError")!
        }
    }
}

protocol ShowError {
    func showErrorView(_ error: Error)
}

extension ShowError where Self: UIViewController {
    func showErrorView(_ error: Error) {
        if let appError = error as? AppError {
            let title = appError.title
            let description = appError.description
            let image = appError.image
            guard let errorView = UINib(nibName: "ErrorView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? ErrorView else { return print("Could not load error view") }
            errorView.errorImageView.image = image
            errorView.errorTitleLabel.text = title
            errorView.errorDescriptionLabel.text = description
            errorView.center = view.center
            view.addSubview(errorView)
        } else {
            print(error)
        }
    }
}
