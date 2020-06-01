//
//  selectColorResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import ObjectMapper

struct selectColorResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: itemColor!

}

@available(iOS 13.0, *)
extension selectColorResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]

    }

}
struct itemColor{
    var color1:String!
    var color2:String!
    var color3:String!
}
extension itemColor:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        color1 <- map["color1"]
        color2 <- map["color2"]
        color3 <- map["color3"]
    }
    
    
}
