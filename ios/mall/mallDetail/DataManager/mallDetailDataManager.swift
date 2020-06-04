//
//  mallDetailDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class detailMallDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var token = UserDefaults.standard.value(forKey: "token") as! String
    func getUser(_ detailMallVC: detailMallViewController, mall_id:Int){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/malls/\(mall_id)", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<detailMallResponse>) in
                switch response.result {
                   
                case .success(let detailMallResponse):
                    if detailMallResponse.code == 100 {
       
                        detailMallVC.navigationController?.navigationBar.topItem?.title = detailMallResponse.result.mall_name
                        detailMallVC.mall_name.text = detailMallResponse.result.mall_name
                        detailMallVC.mallImage.image = UIImage(named:
                            "mall_image")
                    } else if detailMallResponse.code == 201{
                    
                    }
                case .failure:
                    print("error")
                }
            })

    }
}
