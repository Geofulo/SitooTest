//
//  ImageModel.swift
//  Sitoo Test
//
//  Created by Geovanni Fuentes on 2019-10-29.
//  Copyright © 2019 Sitoo. All rights reserved.
//

import Foundation

struct ImageModel: Decodable {
    let resourceid: String?
    let mimetype: String?
    let width: Int?
    let height: Int?
    let filesize: Int32?
    let datecreated: Date?
}
