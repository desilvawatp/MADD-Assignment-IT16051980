//
//  ShoppingTableViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ShoppingTableViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var shoppingData: Array<ShoppingItem> = [
        ShoppingItem(name: "Hair Dryer", price: 8500.0, description: "Philips Hair Dryer", imageURL: "https://3.bp.blogspot.com/-VsT-CRJvpXI/WySx0fv9uQI/AAAAAAAABKM/r07bEGg6TiYnSffYFiujar2-0TIFJNA2gCLcBGAs/s400/www.png"),
        ShoppingItem(name: "Hand Bag", price: 1250.0, description: "Cotton Woven", imageURL: ""),
        ShoppingItem(name: "Water Bottle", price: 500.0, description: "Glass, Shatter proof", imageURL: "")
    ]
    var selected: ShoppingItem? = nil
    
    
    @IBAction func onLogOutBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "logMeOut", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingItemTableCell", for: indexPath) as! ShoppingItemTableCell
        let item = shoppingData[indexPath.row]
        
        cell.name?.text = item.name
        cell.price?.text = String(item.price)
        cell.disc?.text = item.description
        cell.img.download(from: item.imageURL!)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = shoppingData[indexPath.row]
        performSegue(withIdentifier: "showSingleShoppingItem", sender: self)
    }
    
    // send object to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is ShoppingItemViewController) {
            let svc = segue.destination as! ShoppingItemViewController
            svc.shoppingItem = self.selected
        }
        else if (segue.identifier == "logMeOut") {
            // do nothing.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        getShoppingItemList()
    }
    
    func getShoppingItemList() {
        let url = URL(string: "http://localhost:3000/items/all")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { print(error); return }
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! Array<AnyObject>
                var items: Array<ShoppingItem> = []
                
                for elem in jsonData {
                    items.append(
                        ShoppingItem(
                            name: elem.object(forKey: "name") as! String,
                            price: elem.object(forKey: "price") as! Float,
                            description: elem.object(forKey: "description") as! String,
                            imageURL: elem.object(forKey: "imageURL") as! String
                        )
                    )
                }
                
                self.shoppingData = items
                self.table.reloadData()
            } catch {
                error.localizedDescription
            }
            
        }
        task.resume()

    }
}

// download img from internet
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
