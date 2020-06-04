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
    let token:String = UserDefaults.standard.value(forKey: "token") as! String
    func getItems(_ detailMallViewController: detailMallViewController,page:Int) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<itemResponse>) in
                switch response.result {
                   
                case .success(let itemResponse):
                    if itemResponse.code == 100 {
                        
                        detailMallViewController.Items.append(contentsOf: itemResponse.items)
                        detailMallViewController.itemCollection.reloadData()
                    } else {
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
    }
}
