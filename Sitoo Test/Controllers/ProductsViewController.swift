//
//  File.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-30.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController : UITableViewController {
    
    @IBOutlet var productsTableView: UITableView!
    
    var apiClient : SitooAPIClient?
    var products : [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiClient = SitooAPIClient()
        
        productsTableView.dataSource = self
        
        self.loadProducts(index: 0, length: 10)
    }
    
    func loadProducts(index: Int, length: Int) {
        apiClient?.GetProducts(start: index, num: length, completion: { (data) in
            if let data = data {
                self.products.append(contentsOf: data)
                
                DispatchQueue.main.async() {
                    self.productsTableView.reloadData()
                }
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell") as! ProductViewCell
        let product = products[indexPath.row]
        
        cell.titleLabel.text = product.title ?? "No title"
        cell.priceLabel.text = "€\(product.moneyprice ?? "-")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == self.products.count - 1) {
            self.loadProducts(index: self.products.count, length: 10)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailProductSegue" {
            let controller = segue.destination as? DetailProductViewController
            if let index = (productsTableView.indexPathForSelectedRow?.row) {
                controller?.productId = products[index].productid!
                controller?.loadData()
            }
        }
    }
}
