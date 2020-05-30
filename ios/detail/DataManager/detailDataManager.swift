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
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/items/\(item_id)", method:.get,headers: ["x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoiMjAyMC0wNS0yOSAwMDo0ODo1NiIsImlkIjoiZGt3bHNmazIyQG5hdmVyLmNvbSIsInB3IjoiMTIzNCJ9.KyeHmAYHrqYE0gHpuaP-LeQcxx8O4-kyAIg_3rwbUPM"])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<detailResponse>) in
                switch response.result {
                case .success(let detailResponse):
                    if detailResponse.code == 100 {
                        let item:detailItems = detailResponse.result
                        print(item.commnet_num)
                        detailViewController.navigationController?.navigationBar.topItem?.title = item.mall_name
                        detailViewController.mall_name.text = item.mall_name
                        detailViewController.mall_name2.text = item.mall_name
                        detailViewController.item_name.text = item.item_name
                        detailViewController.comment.text = "(\(item.commnet_num!))"
                        detailViewController.price.text = item.price
                    } else if detailResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
        
    }
   
}
