//
//  ViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sellerSwitch: UISwitch!
    
    // Show the registration page
    @IBAction func onRegBtnInLoginScreenClick(_ sender: Any) {
        performSegue(withIdentifier: "showRegistration", sender: self)
    }
    
    // Show the login page
    @IBAction func onLoginBtnInRegScreenClick(_ sender: Any) {
        performSegue(withIdentifier: "showLogin", sender: self)
    }
    
    // Login button in login page is clicked.
    @IBAction func onCorrectLoginBtnClick(_ sender: Any) {
        if (sellerSwitch.isOn) {
            performSegue(withIdentifier: "showAddItemForSeller", sender: self)
        }
        else {
            performSegue(withIdentifier: "showShoppingList", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

