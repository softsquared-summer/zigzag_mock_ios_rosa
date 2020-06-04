//
//  heartCountDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class heartCountDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
var token = UserDefaults.standard.value(forKey: "token") as! String
    func getHeartCount(_ heartViewController: heartViewController){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/hearts", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<heartResponse>) in
                switch response.result {
                case .success(let heartResponse):
                    if heartResponse.code == 100 {
                        heartViewController.setHeartCount(count: heartResponse.result.num )
                    } else if heartResponse.code == 201{
                    
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })

    }
}

