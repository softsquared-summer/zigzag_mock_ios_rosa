//
//  mallDetailResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct detailMallResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: detailMall!
}

@available(iOS 13.0, *)
extension detailMallResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        
    }
    
}
struct detailMall {
    var mall_id: Int?
    var image_url: String?
    var is_favorite: String?
    var mall_name: String!
    var tags:tag!

}

@available(iOS 13.0, *)
extension detailMall: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        mall_id <- map["mall_id"]
        image_url <- map["image_url"]
        is_favorite <- map["is_favorite"]
        mall_name <- map["mall_name"]
        tags <- map["tags"]

    }

}
