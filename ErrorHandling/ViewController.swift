//
//  ViewController.swift
//  ErrorHandling
//
//  Created by Kapil Rathore on 17/11/17.
//  Copyright © 2017 Kapil Rathore. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ShowError {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showErrorView(APIError.serverError)
    }
}
