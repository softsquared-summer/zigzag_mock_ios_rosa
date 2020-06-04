//
//  basketListDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class basketListDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var token = UserDefaults.standard.value(forKey: "token") as! String
    func getBasketItems(_ basketViewController: basketViewController){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/baskets", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<basketListResponse>) in
                switch response.result {
                    
                case .success(let basketResponse):
                    if basketResponse.code == 100 {
                        basketViewController.items.append(contentsOf: basketResponse.result[0].list)
                        print(basketViewController.items[0].color)
                        basketViewController.itemTableView.reloadData()
                    } else if basketResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
        
    }
}
