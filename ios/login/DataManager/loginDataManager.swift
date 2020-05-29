//
//  loginDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class loginDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getUser(_ mainViewController: loginViewController , parameters: [String:String?]){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/login", method: .post, parameters: parameters as Parameters ,encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<userResponse>) in
                switch response.result {
                   
                case .success(let userResponse):
                    print(userResponse)
                    print(parameters)
                    if userResponse.code == 100 {
                        mainViewController.presentAlert(title: "환영합니다!", message: "환영합니다!")
                        UserDefaults.standard.set(parameters["email"], forKey: "user")
                        UserDefaults.standard.set(userResponse.result, forKey: "token")
                    } else if userResponse.code == 201{
                        UIViewController().presentAlert(title: "error", message: userResponse.message!)
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })

    }
}
