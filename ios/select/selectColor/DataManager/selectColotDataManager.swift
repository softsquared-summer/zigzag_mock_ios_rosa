//
//  selectColotDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class selectColorDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDetail(_ selectColorPopUp: selectColorPopUp , item_id:Int){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items/\(item_id)/colors", method:.get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yOSAwMDo0ODo1NiIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.KyeHmAYHrqYE0gHpuaP-LeQcxx8O4-kyAIg_3rwbUPM"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<selectColorResponse>) in
                switch response.result {
                case .success(let selectColorResponse):
                    if selectColorResponse.code == 100 {
                        let colors:itemColor = selectColorResponse.result
                        selectColorPopUp.color1.titleLabel?.text = colors.color1
                        selectColorPopUp.color2.titleLabel?.text = colors.color2
                        selectColorPopUp.color3.titleLabel?.text = colors.color3
                    } else if selectColorResponse.code == 201{
                        
                    }
                case .failure:

                    print("error")
                }
            })
        
    }
   
}
