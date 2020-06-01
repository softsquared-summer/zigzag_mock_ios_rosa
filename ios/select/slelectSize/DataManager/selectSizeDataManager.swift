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
class selectSizeDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDetail(_ selectSizePopUp: selectSizePopUp , item_id:Int){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items/\(item_id)/sizes", method:.get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yOSAwMDo0ODo1NiIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.KyeHmAYHrqYE0gHpuaP-LeQcxx8O4-kyAIg_3rwbUPM"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<selectColorResponse>) in
                switch response.result {
                case .success(let selectSizeResponse):
                    if selectSizeResponse.code == 100 {
                        let sizes:itemColor = selectSizeResponse.result
                        selectSizePopUp.size1.titleLabel?.text = sizes.color1
                        selectSizePopUp.size2.titleLabel?.text = sizes.color2
                        selectSizePopUp.size3.titleLabel?.text = sizes.color3
                    } else if selectSizeResponse.code == 201{
                        
                    }
                case .failure:

                    print("error")
                }
            })
        
    }
   
}
