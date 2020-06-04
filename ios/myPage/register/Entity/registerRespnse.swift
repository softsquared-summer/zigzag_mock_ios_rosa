//
//  registerRespnse.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

@available(iOS 13.0, *)


struct registerResponse {
    var code: Int?
    var message: String?
    var is_success: Bool?
    var result: String?

}

@available(iOS 13.0, *)
extension registerResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        is_success <- map["is_success"]
        result <- map["result"]

    }

}

