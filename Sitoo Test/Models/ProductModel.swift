//
//  ProductModel.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-29.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation

struct ProductModel: Decodable {
    let productid: Int?
    let sku: String?
    let moneyprice: String?
    let title: String?
    
    let skumanufacturer: String?
    let descriptionshort: String?
    let description: String?
    let descriptionhtml: String?
    let deliverystatus: String?
    let moneypriceorg: String?
    let moneypricein: String?
    let unitlabel: String?
    let allowdecimals: Bool?
    let deliveryinfo: String?
    let externalinputtitle: String?
    let offerisenabled: Bool?
    let moneyofferprice: String?
    let offertitle: String?
    let offerdatestart: String?
    let offerdateend: String?
    let active: Bool?
    let activepos: Bool?
    let vatid: Int?
    let deliveryclassid: Int?
    let defaultcategoryid: Int?
    let manufacturerid: Int?
    let manufacturerurl: String?
    let stockcountenable: Bool?
    let stockallowbackorder: Bool?
    let variantparentid: Int?
    let barcode: String?
    let barcodealiases: [String]?
    let offerisactive: Bool?
    let moneyfinalprice: String?
    let vatvalue: Int?
    let productgrouptype: Int?
    let pricelisthasvolume: Bool?
    let variant: [VariantModel]?
    let friendly: String?
    let seo_title: String?
    let seo_keywords: String?
    let seo_description: String?
    let datecreated: Date?
    let datemodified: Date?
}
