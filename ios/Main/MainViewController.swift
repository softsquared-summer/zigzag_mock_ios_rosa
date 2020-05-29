//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MainViewController:  UIViewController, UICollectionViewDataSource  {
    
    
    var Items:[items] = []
    
    
    @IBOutlet weak var adScroll: UIScrollView!
    
    @IBOutlet weak var itemCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainDataManager().getTutorials(self)
        print(Items)
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 10, right:15)
        itemCollection.collectionViewLayout = layout
        
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        adScroll.alwaysBounceVertical = false
        
        let itemCellNib = UINib(nibName: "itemCollectionViewCell", bundle: nil)
        self.itemCollection.register(itemCellNib, forCellWithReuseIdentifier: "item")
        self.itemCollection.delegate = self
        self.itemCollection.dataSource = self
        
        for i in 0..<adImages.count{
            let imageView = UIImageView()
            imageView.image = UIImage(named: adImages[i])
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPosition, y:-40,
                                     width: self.view.frame.width,
                                     height: self.adScroll.frame.height)
            
            adScroll.contentSize.width =
                self.view.frame.width * CGFloat(1+i)
            adScroll.contentSize.height = 120
            
            adScroll.addSubview(imageView)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
}

@available(iOS 13.0, *)
extension MainViewController: UICollectionViewDelegateFlowLayout {
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
        cell.item_image.image = UIImage(named: "스커트")
        cell.item_name.text = Items[indexPath.item].item_name
        cell.mall_name.text = Items[indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
        if Items[indexPath.item].is_free_ship == "Y" {
            cell.free_ship.text = "무료배송"
        }else{
            cell.free_ship.text = ""
            cell.free_ship.isHidden = false
        }
        if Items[indexPath.item].is_heart == "Y" {
            cell.heart.isSelected = true
        }else {
            cell.heart.isSelected = false
        }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = Items[indexPath.item].price
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: 185, height:300)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.item_id = Items[indexPath.item].item_id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
