//
//  heartResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import ObjectMapper


struct heartResponse {
    var code: Int!
    var message: String!
    var is_success: Bool!
    var result: heart!

}

@available(iOS 13.0, *)
extension heartResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        is_success <- map["is_success"]
        result <- map["result"]

    }

}
struct heart{
    var num:String?
    var list:String?
}
extension heart: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        num <- map["num"]
        list <- map["list"]
    }

}
