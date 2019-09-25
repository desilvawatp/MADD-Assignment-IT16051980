//
//  ShoppingTableViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ShoppingTableViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var data: Array<ShoppingItem> = [
        ShoppingItem(name: "Hair Dryer", price: 8500.0, description: "Philips Hair Dryer", imageURL: "https://3.bp.blogspot.com/-VsT-CRJvpXI/WySx0fv9uQI/AAAAAAAABKM/r07bEGg6TiYnSffYFiujar2-0TIFJNA2gCLcBGAs/s400/www.png"),
        ShoppingItem(name: "Hand Bag", price: 1250.0, description: "Cotton Woven", imageURL: ""),
        ShoppingItem(name: "Water Bottle", price: 500.0, description: "Glass, Shatter proof", imageURL: "")
    ]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingItemTableCell", for: indexPath) as! ShoppingItemTableCell
        let item = data[indexPath.row]
        
        cell.name?.text = item.name
        cell.price?.text = String(item.price)
        cell.disc?.text = item.description
        cell.img.download(from: item.imageURL)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("appeareD")
    }
}

// embedding images.
extension UIImageView {
    func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
    
    func download(from url: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let urlObject = URL(string: url) else { return }
        download(from: urlObject)
    }
}
