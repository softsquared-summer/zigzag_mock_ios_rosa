//
//  detailMallViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import WCLShineButton

class detailMallViewController: UIViewController, UICollectionViewDelegate {
    var mallName = ""
    let images:[String] = ["반팔8","스커트6","스커트7","스커트8","아우터2","아우터3","아우터4","패딩1","패딩2","스커트","아우터1","데님1","바지2","바지3","바지4","셔츠1","셔츠3","셔츠4","반팔1","반팔2","반팔3","반팔4","반팔5","반팔6","반팔7","스커트2","스커트3","스커트4","스커트5","아우터1","원피스1","원피스2","원피스3","가디건1","가디건2","가디건3","가디건4","가디건5","가디건6"]
    var mall_id:Int? = 0
    var Items:[items] = []
    var favorite:String = ""
    @IBOutlet weak var itemCollection: UICollectionView!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var mallImage: UIImageView!
    @IBOutlet weak var is_favorite: UIButton!
    var bt1:WCLShineButton = WCLShineButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemCellNib = UINib(nibName: "heartCollectionViewCell", bundle: nil)
        self.itemCollection.register(itemCellNib, forCellWithReuseIdentifier: "heart")
        self.itemCollection.delegate = self
        self.itemCollection.dataSource = self
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 7, left: 17, bottom: 10, right:17)
        itemCollection.collectionViewLayout = layout

        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        
        
        
        var param1 = WCLShineParams()
        param1.bigShineColor = ColorPalette.zigzagPink
        param1.smallShineColor = UIColor.systemGray6
        param1.animDuration = 1
        bt1 = WCLShineButton(frame: .init(x: 330, y:30, width: 50, height: 50), params: param1)
        bt1.tag = self.mall_id!
        bt1.addTarget(self, action: #selector(starAction), for: .valueChanged)
        bt1.fillColor = ColorPalette.zigzagPink
            bt1.isSelected = false
        bt1.image = .custom(UIImage(named: "emptyStar")!)
        bt1.color = UIColor.systemGray5
        self.view.addSubview(bt1)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        detailMallDataManager().getUser(self,mall_id: self.mall_id!)
        itemDataManager().getItems(self,page: 1)
        itemDataManager().getItems(self,page: 2)
        itemDataManager().getItems(self,page: 3)
        itemDataManager().getItems(self,page: 4)
    }
    @objc func starAction(_ sender: WCLShineButton){
        self.presentAlert(title: "찜하기", message: "쇼핑몰 찜하기 성공!")
    }
    
    let backBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        barButtonItem.image = UIImage(named: "backButton")
        return barButtonItem
    }()
    
}
extension detailMallViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCollection.dequeueReusableCell(withReuseIdentifier: "heart", for: indexPath) as! heartCollectionViewCell
        cell.mall_name.font = UIFont.systemFont(ofSize: 10)
        cell.item_name.font = UIFont.systemFont(ofSize: 14)
        cell.discount.font = UIFont.systemFont(ofSize: 14)
        cell.price.font = UIFont.boldSystemFont(ofSize: 14)
        cell.item_image.image = UIImage(named: images[indexPath.row])
        cell.item_name.text = Items[indexPath.item].item_name
        cell.mall_name.text = Items[indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
//        if Items[indexPath.item].is_heart == "Y" {
//            cell.isHeart = true
//            cell.bt1.isSelected = true
//        }else {
//            cell.isHeart = false
//            cell.bt1.isSelected = false
//        }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = Items[indexPath.item].price
        cell.item_id = Items[indexPath.item].item_id
//        cell.superController = self
        cell.free_ship.isHidden = true
        cell.discount.text = Items[indexPath.item].discount
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height:200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.item_id = Items[indexPath.item].item_id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}



