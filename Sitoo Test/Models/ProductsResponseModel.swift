//
//  ProductsResponseModel.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-29.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation

struct ProductsResponseModel: Decodable {
    let totalcount: Int?
    let items: [ProductModel]?
}
