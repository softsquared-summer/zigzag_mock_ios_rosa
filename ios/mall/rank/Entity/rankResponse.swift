//
//  rankResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper


struct rankResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: [mall]!

}

@available(iOS 13.0, *)
extension rankResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]

    }

}
struct mall {
    var mall_id: Int?
    var image_url: String?
    var is_favorite: String?
    var mall_name: String!
    var mall_rank: Int!
    var tags:tag!

}

@available(iOS 13.0, *)
extension mall: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        mall_id <- map["mall_id"]
        image_url <- map["image_url"]
        is_favorite <- map["is_favorite"]
        mall_name <- map["mall_name"]
        mall_rank <- map["mall_rank"]
        tags <- map["tags"]

    }

}

struct tag {
    var tag_id: Int?
    var tag_name: String!


}

@available(iOS 13.0, *)
extension tag: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        tag_id <- map["tag_id"]
        tag_name <- map["tag_name"]
    }

}
