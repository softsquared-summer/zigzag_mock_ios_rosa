//
//  heartViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class heartViewController: UIViewController, UICollectionViewDataSource{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var heartItems:[items] = []
    @IBOutlet weak var heartCollection: UICollectionView!
    @IBOutlet weak var heartCount: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        heartCountDataManager().getHeartCount(self)
        heartDataManager().getUser(self)
        
        
        let titleLabel = UILabel()
        titleLabel.text = "  찜한 아이템".localized
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        let titleItem:UIBarButtonItem  = UIBarButtonItem.init(customView: titleLabel)
        let leftButtons:[UIBarButtonItem]? = [titleItem]
        let rightButtons:[UIBarButtonItem]? = [rightBarButtonItem,heartBarButtonItem,menuBarButtonItem]
        self.tabBarController?.navigationController?.navigationBar.topItem?.setLeftBarButtonItems(leftButtons, animated: false)
        self.tabBarController?.navigationController?.navigationBar.topItem?.setRightBarButtonItems(rightButtons, animated: false)
        
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 7, left: 17, bottom: 10, right:17)
        heartCollection.collectionViewLayout = layout
        
        
        let itemCellNib = UINib(nibName: "heartCollectionViewCell", bundle: nil)
        self.heartCollection.register(itemCellNib, forCellWithReuseIdentifier: "heart")
        self.heartCollection.delegate = self
        self.heartCollection.dataSource = self
        
    }
    func setHeartCount(count:String?){
        self.heartCount.text = count
    }
}
extension heartViewController: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = heartCollection.dequeueReusableCell(withReuseIdentifier: "heart", for: indexPath) as! heartCollectionViewCell
        
        
        cell.item_image.image = UIImage(named: "스커트")
        cell.item_name.text = heartItems[indexPath.item].item_name
        cell.mall_name.text = heartItems[indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
        if heartItems[indexPath.item].is_free_ship == "Y" {
            cell.free_ship.text = "무료배송"
            
        }else{
            cell.free_ship.text = ""
            cell.free_ship.isHidden = true
        }
        //    if heartItems[indexPath.item].is_heart == "Y" {
        //        cell.isHeart = true
        //        cell.bt1.isSelected = true
        //    }else {
        //        cell.isHeart = false
        //        cell.bt1.isSelected = false
        //    }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = heartItems[indexPath.item].price
        cell.item_id = heartItems[indexPath.item].item_id
        //    cell.superController = self
        cell.discount.text = heartItems[indexPath.item].discount
      
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heartItems.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height:200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.item_id = heartItems[indexPath.item].item_id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
