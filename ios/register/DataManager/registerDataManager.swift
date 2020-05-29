//
//  registerDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class registerDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getRegister(_ registerViewController: registerViewController , parameters: [String:String?]){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/user", method: .post, parameters: parameters as Parameters ,encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<registerResponse>) in
                switch response.result {
                case .success(let registerResponse):
                    print(registerResponse)
                    if registerResponse.code == 100 {
                        registerViewController.presentAlert(title: "회원가입 완료!", message: "환영합니다!")
                    } else if registerResponse.code == 201{
                        registerViewController.presentAlert(title: "error", message: registerResponse.message!)
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })

    }
}
