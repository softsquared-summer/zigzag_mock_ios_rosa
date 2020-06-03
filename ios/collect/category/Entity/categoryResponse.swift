//
//  categoryResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper


struct categoryResponse {
    var code: Int!
    var message: String!
    var is_success: Bool!
    var result: [categoryItem]!

}

@available(iOS 13.0, *)
extension categoryResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        is_success <- map["is_success"]
        result <- map["result"]

    }

}
struct categoryItem {
    var item_id: Int!
    var item_category: String!
    var item_category_detail: String!
    var item_image: categoryItemImage!
    var is_free_ship: String!
    var is_heart: String!
    var mall_name: String!
    var item_name: String!
    var discount:String!
    var price: String!
    
}

extension  categoryItem: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        item_id <- map["item_id"]
        item_category <- map["item_category"]
        item_category_detail <- map["item_category_detail"]
        item_image <- map["item_image"]
        is_free_ship <- map["is_free_ship"]
        is_heart <- map["is_heart"]
        mall_name <- map["mall_name"]
        item_name <- map["item_name"]
        discount <- map["discount"]
        price <- map["price"]
    }
    
}
struct categoryItemImage{
    var url1:String!
    var url2:String!
}
extension categoryItemImage:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        url1 <- map["image_url1"]
        url2 <- map["image_url2"]
    }
    
    
}
