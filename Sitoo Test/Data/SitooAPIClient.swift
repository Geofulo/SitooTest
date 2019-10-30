//
//  SitooAPIClient.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-29.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation

class SitooAPIClient {
    private let urlString = "https://api-sandbox.mysitoo.com/v2/accounts/90316/"
    private let apiId = "90316-125"
    private let apiPwd = "pfX0Y7A2TYAlZ571IKEO7AKoXza6YlvsP8kKvAu3"
    private let apiToken = "OTAzMTYtMTI1OnBmWDBZN0EyVFlBbFo1NzFJS0VPN0FLb1h6YTZZbHZzUDhrS3ZBdTM="
    private let productsEndpoint = "sites/1/products.json"
    private let productEndpoint = "sites/1/products/"
    
    let session : URLSession
    
    init() {
        let userPasswordString = "\(apiId):\(apiPwd)"
        let userPasswordData = userPasswordString.data(using: .utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString(options: .endLineWithCarriageReturn)
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization" : "Basic \(base64EncodedCredential)"]
        
        session = URLSession(configuration: config)
    }
    
    func GetProducts(start: Int, num: Int, completion: @escaping ([ProductModel]?) -> ()) {
        if let url = URL(string: "\(urlString)\(productsEndpoint)?start=\(start)&num\(num)&fields=productid,sku,title,moneyprice") {
            let task = session.dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    print("Response Error: \(String(describing: error?.localizedDescription))")
                    return
                }
                do {
                    
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(ProductsResponseModel.self, from: dataResponse)
                    
                    completion(res.items)
                    return
                } catch let parsingError {
                    print("Error", parsingError)
                    completion(nil)
                    return
                }
            })
            
            
            
            task.resume()
        }
        else {
            print("Not valid URL")
        }
    }
    
    func GetProduct(productId: Int, completion: @escaping (ProductModel?) -> ()) {
        if let url = URL(string: "\(urlString)\(productEndpoint)\(productId).json") {
            print("Url: \(url))")
            let task = session.dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) in
                print("Response: \(response))")
                guard let dataResponse = data, error == nil else {
                    print("Response Error: \(String(describing: error?.localizedDescription))")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(ProductModel.self, from: dataResponse)
                    
                    completion(res)
                    return
                } catch let parsingError {
                    print("Error", parsingError)
                    completion(nil)
                    return
                }
            })
            
            task.resume()
        }
        else {
            print("Not valid URL")
        }
    }
    
    func GetProductImages(productId: Int, completion: @escaping ([ImageModel]?) -> ()) {
        if let url = URL(string: "\(urlString)\(productEndpoint)\(productId)/images.json?num=2") {
            let task = session.dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) in
                print("Response: \(response))")
                guard let dataResponse = data, error == nil else {
                    print("Response Error: \(String(describing: error?.localizedDescription))")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(ProductsImagesResponseModel.self, from: dataResponse)
                    
                    completion(res.items)
                    return
                } catch let parsingError {
                    print("Error", parsingError)
                    completion(nil)
                    return
                }
            })
            
            task.resume()
        }
        else {
            print("Not valid URL")
        }
    }
}
