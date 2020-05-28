//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class MainDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getTutorials(_ mainViewController: MainViewController) {        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items", method: .get,headers: ["x-access-token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yNyAyMjozMzozMyIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.nScOXTymTmJVpuCtNL-c_JBatNDMXFXV_wviZ1_Evwo"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<itemResponse>) in
                switch response.result {
                   
                case .success(let itemResponse):
                    if itemResponse.code == 100 {
                        print(itemResponse.items)
                        mainViewController.Items = itemResponse.items
                        mainViewController.itemCollection.reloadData()
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
