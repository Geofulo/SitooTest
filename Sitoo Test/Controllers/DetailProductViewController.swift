//
//  DetailProductViewController.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-30.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation
import UIKit

class DetailProductViewController : UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var photo1Image: UIImageView!
    @IBOutlet weak var photo2Image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var productId : Int?
    var apiClient = SitooAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadData() {
        self.apiClient.GetProduct(productId: self.productId!, completion: { (data) in
            if let product = data {
                DispatchQueue.main.async {
                    self.navigationItem.title = product.title
                    
                    if let price = product.moneyprice {
                        self.priceLabel.text = "€\(price)"
                    } else {
                        self.priceLabel.isHidden = true
                    }
                    
                    if let description = product.descriptionshort {
                        self.descriptionLabel.text = description
                    } else {
                        self.descriptionLabel.isHidden = true
                    }
                }
            }
        })
        
        self.apiClient.GetProductImages(productId: self.productId!, completion: { (data) in
            if let images = data {
                if images.count > 0 {
                    if let image1Url = images[0].resourceid {
                        URLSession.shared.dataTask(with: URL(string: image1Url)!, completionHandler: { (data, response, error) in
                            DispatchQueue.main.async {
                                self.photo1Image.image = UIImage(data: data!)
                            }
                        })
                    } else {
                        self.photo1Image.isHidden = true
                    }
                }
                
                if images.count > 1 {
                    if let image2Url = images[1].resourceid {
                        URLSession.shared.dataTask(with: URL(string: image2Url)!, completionHandler: { (data, response, error) in
                            DispatchQueue.main.async {
                                self.photo2Image.image = UIImage(data: data!)
                            }
                        })
                    } else {
                        self.photo2Image.isHidden = true
                    }
                }
            }
        })
        
    }
}
