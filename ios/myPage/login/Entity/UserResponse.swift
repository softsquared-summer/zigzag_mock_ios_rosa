//
//  UserResponse.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper



struct userResponse {
    var code: Int?
    var message: String?
    var is_success: Bool?
    var result: String?
    
}

extension userResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        is_success <- map["is_success"]
        result <- map["result"]
        
    }
    
}

