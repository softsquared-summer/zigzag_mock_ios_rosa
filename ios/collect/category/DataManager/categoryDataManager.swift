//
//  categoryDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class categoryDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getUser(_ categoryViewController: categoryViewController,keyword: String!){
        let key = String(keyword)
        print(key)
        print("\(self.appDelegate.baseUrl)/items?category=\(key)")
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items?category=\(key)", method: .get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yOSAwMDo0ODo1NiIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.KyeHmAYHrqYE0gHpuaP-LeQcxx8O4-kyAIg_3rwbUPM"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<categoryResponse>) in
                switch response.result {
                   
                case .success(let categoryResponse):
                    print(categoryResponse)
                    if categoryResponse.code == 100 {
                       
                    } else if categoryResponse.code == 201{
                    
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })

    }
}

