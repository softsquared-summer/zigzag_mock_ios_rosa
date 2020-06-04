//
//  rankDataManager.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class rankDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var token = UserDefaults.standard.value(forKey: "token") as! String
    func getMalls(_ rankViewController: rankViewController,page:Int){
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/malls?page=\(page)", method: .get,headers: ["x-access-token": token])
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<rankResponse>) in
                switch response.result {
                   
                case .success(let rankResponse):
                    if rankResponse.code == 100 {
                        let malls:[mall] = rankResponse.result
                        rankViewController.malls.append(contentsOf: malls)
                        rankViewController.mallTableView.reloadData()
                    } else if rankResponse.code == 201{
                    
                    }
                case .failure:
//                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })

    }
}

