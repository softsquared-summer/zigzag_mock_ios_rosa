//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class itemDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let token:String = UserDefaults.standard.value(forKey: "token") as! String
    func getTutorials(_ detailMallViewController: detailMallViewController) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items", method: .get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0zMCAyMzo0NDo0MSIsImlkIjoidGVzdCIsInB3IjoiMTIzNCJ9.wqikNdprILNQEYky5-NvoWsO9b-pswfs8555uv-3KHI"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<itemResponse>) in
                switch response.result {
                   
                case .success(let itemResponse):
                    if itemResponse.code == 100 {
                        print(itemResponse.items)
                        detailMallViewController.Items = itemResponse.items
                        detailMallViewController.itemCollection.reloadData()
                    } else {
                        print(itemResponse.code)
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
    }
}
