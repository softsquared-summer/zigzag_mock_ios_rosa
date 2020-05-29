//
//  detailDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class detailDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDetail(_ detailViewController: detailViewController , item_id:Int){
        var token:String = UserDefaults.standard.value(forKey: "token") as! String
        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items/\(item_id)", method:.get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yNyAyMjozMzozMyIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.nScOXTymTmJVpuCtNL-c_JBatNDMXFXV_wviZ1_Evwo"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<detailResponse>) in
                switch response.result {
                case .success(let detailResponse):
                    if detailResponse.code == 100 {
                        print(detailResponse.result)
                    } else if detailResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
        
    }
}
