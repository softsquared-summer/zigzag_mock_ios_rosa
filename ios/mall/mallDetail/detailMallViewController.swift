//
//  detailMallViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import WCLShineButton

class detailMallViewController: UIViewController {
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
        let itemCellNib = UINib(nibName: "itemCollectionViewCell", bundle: nil)
        self.itemCollection.register(itemCellNib, forCellWithReuseIdentifier: "item")
        self.itemCollection.delegate = self
        self.itemCollection.dataSource = self
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right:10)
        itemCollection.collectionViewLayout = layout
        
        
        
        var param1 = WCLShineParams()
        param1.bigShineColor = ColorPalette.zigzagPink
        param1.smallShineColor = UIColor.systemGray6
        param1.animDuration = 1
        bt1 = WCLShineButton(frame: .init(x: 320, y:120, width: 50, height: 50), params: param1)
        bt1.fillColor = ColorPalette.zigzagPink
            bt1.isSelected == false
        bt1.image = .star
        bt1.color = UIColor.systemGray5
        self.view.addSubview(bt1)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        detailMallDataManager().getUser(self,mall_id: self.mall_id!)
        itemDataManager().getTutorials(self)
    }
    
    
}
extension detailMallViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCollection.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCollectionViewCell
        let url1 = URL(string: Items[indexPath.item].item_image.url1)
        do{
            let data1 = try Data(contentsOf: url1!)
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(data: data1)
            imageView.frame = CGRect(x: cell.frame.width, y: 0,
                                     width: cell.frame.width,
                                     height: 300)
            
            //            cell.item_image.image = UIImage(data: data1)
            cell.addSubview(imageView)
        }catch let err{
            print("urlError")
        }
        cell.mall_name.font = UIFont.systemFont(ofSize: 10)
        cell.item_name.font = UIFont.systemFont(ofSize: 14)
        cell.discount.font = UIFont.systemFont(ofSize: 14)
        cell.price.font = UIFont.boldSystemFont(ofSize: 14)
        cell.item_image.image = UIImage(named: "스커트")
        cell.item_name.text = Items[indexPath.item].item_name
        cell.mall_name.text = Items[indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
        if Items[indexPath.item].is_heart == "Y" {
            cell.isHeart = true
            cell.bt1.isSelected = true
        }else {
            cell.isHeart = false
            cell.bt1.isSelected = false
        }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = Items[indexPath.item].price
        cell.item_id = Items[indexPath.item].item_id
        cell.superController = self
        cell.free_ship.isHidden = true
        cell.discount.text = Items[indexPath.item].discount
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 3
        return CGSize(width: 120, height:250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.item_id = Items[indexPath.item].item_id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}



