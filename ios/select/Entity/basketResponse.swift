//
//  basketResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import ObjectMapper


struct basketResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: AnyObject!

}

@available(iOS 13.0, *)
extension basketResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]

    }

}
