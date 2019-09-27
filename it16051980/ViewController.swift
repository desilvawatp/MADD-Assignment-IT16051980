//
//  ViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sellerSwitch: UISwitch!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPass: UITextField!
    
    @IBOutlet weak var regEmail: UITextField!
    @IBOutlet weak var regPass: UITextField!
    @IBOutlet weak var regPassConfirm: UITextField!
    
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
        var data = ["email": loginEmail.text!, "password": loginPass.text!]
        var authenticated = false
        var requestCompleted = false
        
        do {
            var serializedData = try JSONSerialization.data(withJSONObject: data, options: [])
            var req = URLRequest(url: URL(string: "http://localhost:3000/user/login")!)
            req.httpBody = serializedData
            req.httpMethod = "POST"
            
            print(serializedData)
            print(String(data: serializedData, encoding: .utf8))
            
            URLSession.shared.dataTask(with: req) { data, response, error in
                if let data = data {
                    do {
                        let resStr = String(data: data, encoding: .utf8)
                        print("response:\(resStr)")
                        authenticated = ((resStr?.contains("true"))!)
                        requestCompleted = true
                    }
                    catch {
                        requestCompleted = true
                    }
                }
                else if let error = error {
                    print(error)
                    requestCompleted = true
                }
                
                requestCompleted = true
            }.resume()
        }
        catch {
            print("Unable to serialize")
        }
        
        
        while (!requestCompleted) {
            
        }
        
        if (authenticated) {
            if (sellerSwitch.isOn) {
                performSegue(withIdentifier: "showAddItemForSeller", sender: self)
            }
            else {
                performSegue(withIdentifier: "showShoppingList", sender: self)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

