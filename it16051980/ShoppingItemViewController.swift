//
//  ShoppingItemViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var disc: UILabel!
    
    var shoppingItem: ShoppingItem? = nil
    
    @IBAction func onBuyBtnClick(_ sender: Any) {
    }
    
    // go to items.
    @IBAction func onCancelBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "showShoppingItems", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.shoppingItem != nil) {
            name.text = self.shoppingItem?.name
            price.text = self.shoppingItem?.price.description
            disc.text = self.shoppingItem?.description
            img.download(from: self.shoppingItem!.imageURL!)
        }
    }
}
