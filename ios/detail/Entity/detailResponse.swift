//
//  detailResponse.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import ObjectMapper

@available(iOS 13.0, *)


struct detailResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: detailItems!

}

@available(iOS 13.0, *)
extension detailResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]

    }

}
struct detailItems {
    var id: Int!
    var image: detailItemImage!
    var is_heart: String!
    var mall_name: String!
    var item_name: String!
    var discount:String!
    var price: String!
    var commnet_num:Int!
    
}

extension detailItems: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        mall_name <- map["mall_name"]
        item_name <- map["item_name"]
        commnet_num <- map["comment_num"]
        is_heart <- map["is_heart"]
        discount <- map["discount"]
        price <- map["price"]
        image <- map["image"]

    }
    
}
struct detailItemImage{
    var url1:String!
    var url2:String!
}
extension detailItemImage:Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        url1 <- map["image_url1"]
        url2 <- map["image_url2"]
    }
    
    
}
