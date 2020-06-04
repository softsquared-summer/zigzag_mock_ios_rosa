//
//  basketResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct basketListResponse {
    var code: Int!
    var message: String!
    var is_success: Bool!
    var result: [listResponse]!
    
}

@available(iOS 13.0, *)
extension basketListResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        is_success <- map["is_success"]
        result <- map["result"]
        
    }
    
}

struct listResponse{
    var num: Int!
    var list : [basketItem]!
}

extension listResponse:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        num <- map["num"]
        list <- map["list"]
    }
}

struct basketItem {
    var item_id: Int!
    var mall_name: String!
    var item_name:String!
    var image:basketitemImage!
    var size:String!
    var color :String!
    var num: Int!
    var price:String!
    var ship:Int!
}
extension basketItem:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        item_id <- map["item_id"]
        mall_name <- map["mall_name"]
        item_name <- map["item_name"]
        image <- map["image"]
        size <- map["size"]
        color  <- map["color"]
        num <- map["num"]
        price <- map["price"]
        ship <- map["ship"]
    }
}
struct basketitemImage{
    var url1:String!
    var url2:String!
}
extension basketitemImage:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        url1 <- map["image_url1"]
        url2 <- map["image_url2"]
    }
    
    
}
