//
//  ViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Show the registration page
    @IBAction func onRegBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "showRegistration", sender: self)
    }
    
    // Show the login page
    @IBAction func onLoginBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "showLogin", sender: self)
    }
    
    // Login button in login page is clicked.
    @IBAction func onCorrectLoginBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "showAddItemForSeller", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

