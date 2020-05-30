//
//  detailHeartResponse.swift
//  ios
//
//  Created by 이진하 on 2020/05/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import ObjectMapper

struct detailHeartResponse {
    var code: Int?
    var message: String?
    var isSuccess: Bool?
    var result: AnyObject!

}


extension detailHeartResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]

    }

}
