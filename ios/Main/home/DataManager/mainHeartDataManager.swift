//
//  detailHeartDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/05/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class mainHeartDataManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var token = UserDefaults.standard.value(forKey: "token") as! String
    func set_heart(_ mainViewController: MainViewController , item_id:Int){
        let params:[String:Int] = [
            "item_id" : item_id
        ]
        Alamofire
            .request("\(self.appDelegate.baseUrl)/heart", method:.post, parameters: params,encoding: JSONEncoding.default, headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<detailHeartResponse>) in
                switch response.result {
                case .success(let detailHeartResponse):
                    print(detailHeartResponse)
                    if detailHeartResponse.code == 100 {
                        
                        mainViewController.presentAlert(title: "Success", message: detailHeartResponse.message!)
                    } else if detailHeartResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
    }
    
}
