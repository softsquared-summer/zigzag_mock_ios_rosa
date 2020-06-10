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
                        var totalPrice:Int = 0
                        var totalShip:Int = 0
                        let t = ""
                        basketViewController.items =  basketResponse.result[0].list
                        basketViewController.num = basketResponse.result[0].num
                        for i in 0...basketViewController.items.count-1{
                            totalPrice += Int(self.printChars(string: basketResponse.result[0].list[i].price, t: t))!
                            totalShip += basketResponse.result[0].list[i].ship
                        }
                        let expectPrice = totalShip + totalPrice
                        basketViewController.all_price.text = String(self.comma(num: totalPrice)) + "원"
                        basketViewController.all_ship.text = String(self.comma(num: totalShip)) + "원"
                        basketViewController.total_price.text = String(self.comma(num: expectPrice)) + "원"
                        basketViewController.buyButton.setTitle("총 "+String(self.comma(num: expectPrice)) + "원 구매하기", for: .normal)
                        basketViewController.itemTableView.reloadData()
                    } else if basketResponse.code == 201{
                        
                    }
                case .failure:
                    //                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("error")
                }
            })
        
    }
    func comma(num: Int) -> String{
        var point = 0
        var str = ""
        
        var strNum = String(num)
        point = strNum.count % 3
        
        let len = strNum.count
        
        while(point < len) {
            for i in 0...2 {
                str =  String(strNum[strNum.index(before: strNum.endIndex)]) + str
                strNum.remove(at: strNum.index(before: strNum.endIndex))
            }
            if strNum != "" {str = "," + str}
            point += 3
            //str = 005
            //strNum = 1203
        }
        str = strNum + str
        
        return str
        
    }
    func printChars(string: String, t:String) -> String{
        var str = string
        var t2 = t
        if(str.count == 0){
            return t2
        }else{
            if str[str.startIndex] == "," {
                str.remove(at: str.startIndex)
            }else if str[str.startIndex] == "원" {
                str.remove(at: str.startIndex)
            }else {
                t2 =  t2 + String(str[str.startIndex])
                str.remove(at: str.startIndex)
            }
        }
        return printChars(string: str, t: t2)
    }
}
