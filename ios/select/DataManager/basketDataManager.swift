//
//  basketResponse.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class basketDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var token = UserDefaults.standard.value(forKey: "token") as! String
    func getUser(_ selectPopUp: selectPopUp , parameters: [String:Any?]){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/basket", method: .post, parameters: parameters as Parameters ,encoding: JSONEncoding.default,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<basketResponse>) in
                switch response.result {
                    
                case .success(let basketResponse):
                    print(basketResponse)
                    print(parameters)
                    if basketResponse.code == 100 {
                        selectPopUp.presentAlert(title: "success", message: basketResponse.message!)
                    } else if basketResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
        
    }
}
