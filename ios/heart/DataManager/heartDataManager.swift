//
//  heartDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class heartDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
var token = UserDefaults.standard.value(forKey: "token") as! String
    func getUser(_ heartViewController: heartViewController){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<itemResponse>) in
                switch response.result {
                   
                case .success(let itemResponse):
                    if itemResponse.code == 100 {
                        var heartItems:[items] = []
                        for item in itemResponse.items {
                            if item.is_heart == "Y" {
                                heartItems.append(item)
                                
                            }else{
                                continue
                            }
                        }
                        print(heartItems)
                        print(heartItems.count)
                        heartViewController.heartItems = heartItems
                        heartViewController.heartCollection.reloadData()
                    } else if itemResponse.code == 201{
                    
                    }
                case .failure:
                    print("error")
                }
            })

    }
}

