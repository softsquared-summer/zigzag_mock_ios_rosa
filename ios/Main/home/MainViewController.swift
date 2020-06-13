//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit
import FSPagerView
import WCLShineButton

@available(iOS 13.0, *)
class MainViewController:  UIViewController, UICollectionViewDataSource {
    
    let images:[String] = ["스커트","아우터1","데님1","바지2","바지3","바지4","셔츠1","셔츠3","셔츠4","스커트2","스커트3","스커트4","스커트5","아우터1","원피스1","원피스2","원피스3","가디건1","가디건2","가디건3","가디건4","가디건5","가디건6","반팔1","반팔2","반팔3","반팔4","반팔5","반팔6","반팔7","반팔8","스커트6","스커트7","스커트8","아우터2","아우터3","아우터4","패딩1","패딩2"]
    let section = ["sponsored","second"]
    var Items:[items] = []
    var sponItems:[items] = [
        items(item_id: 2, item_category: "상의", item_category_detail: "티셔츠", item_image: nil, is_free_ship: "N", is_heart: "N", mall_name: "오브로밍", item_name: "브이넥 셔링 크롭 반팔", discount: "0%", price: "21,000"),
        items(item_id: 1, item_category: "원피스/세트", item_category_detail: "롱원피스", item_image: nil, is_free_ship: "N", is_heart: "N", mall_name: "기프티박스", item_name: "메기 린넨 스퀘어넥", discount: "0%", price: "15,900"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000")
        
    ]
    
    
    
    @IBOutlet weak var itemCollection: UICollectionView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        //pagerView
        let pagerView = FSPagerView(frame: CGRect(x: 0, y: 55, width: self.view.frame.width, height: 80))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(pagerView)
        
        
        
        
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 7, left: 17, bottom: 10, right:17)
        itemCollection.collectionViewLayout = layout
        
        
        let itemCellNib = UINib(nibName: "itemCollectionViewCell", bundle: nil)
        self.itemCollection.register(itemCellNib, forCellWithReuseIdentifier: "item")
        self.itemCollection.delegate = self
        self.itemCollection.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //data load
        MainDataManager().getItems(self, page: 1)
        MainDataManager().getItems(self, page: 2)
        MainDataManager().getItems(self, page: 3)
        MainDataManager().getItems(self, page: 4)
        //navigation Bar add
//        self.tabBarController?.navigationItem.rightBarButtonItem = basketBarButtonItem
        
        let searchItem:UIBarButtonItem = searchBarButtonItem
        let zigzag:UIBarButtonItem = zigzagBarButtonItem
        let barButtons:[UIBarButtonItem]? = [zigzag , searchItem]
        let rightButtons:[UIBarButtonItem]? = [basketBarButtonItem]
        self.tabBarController?.navigationController?.navigationBar.topItem?.setLeftBarButtonItems(barButtons, animated: false)
        self.tabBarController?.navigationController?.navigationBar.topItem?.setRightBarButtonItems(rightButtons, animated: false)
        self.tabBarController?.navigationController?.navigationBar.barTintColor = .white
        self.tabBarController?.navigationController?.navigationBar.isTranslucent = false
        self.tabBarController?.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.tabBarController?.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        //tabBar color
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.shadowImage = UIImage()
        
    }
    
    lazy var basketBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: self, action: #selector(goBasketList))
        barButtonItem.imageInsets = .init(top: 0, left:0, bottom: 0, right: 0)
        barButtonItem.image = UIImage(named: "zigzag_bag_standard")
        return barButtonItem
    }()
    
    @objc func goBasketList(_ sender: Any) {
        guard let navigationViewController = self.navigationController else {
            self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(basketViewController(), animated: true)
    }
    
}

@available(iOS 13.0, *)
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionItem:[[items]] = [sponItems, Items]
        let cell = itemCollection.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCollectionViewCell
        
        if indexPath.section == 0 {
            cell.item_image.frame = CGRect(x: 0, y: 0, width: 120, height: 140)
        }else{
            cell.item_image.frame = CGRect(x: 0, y: 0, width: 185, height: 225)
        }
        cell.item_image.image = UIImage(named:images[indexPath.row])
        cell.item_name.text = sectionItem[indexPath.section][indexPath.item].item_name
        cell.mall_name.text = sectionItem[indexPath.section][indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
        if sectionItem[indexPath.section][indexPath.item].is_free_ship == "Y" {
            cell.free_ship.text = "무료배송"
        }else{
            cell.free_ship.text = ""
            cell.free_ship.isHidden = true
        }

        cell.bt1.tag = sectionItem[indexPath.section][indexPath.item].item_id
        cell.bt1.addTarget(self, action: #selector(heartAction), for: .valueChanged)
  
        cell.item_id = sectionItem[indexPath.section][indexPath.item].item_id
        if sectionItem[indexPath.section][indexPath.item].is_heart == "Y" {
            cell.isHeart = true
            cell.bt1.isSelected = true
        }else {
            cell.isHeart = false
            cell.bt1.isSelected = false
        }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = sectionItem[indexPath.section][indexPath.item].price
        cell.discount.text = sectionItem[indexPath.section][indexPath.item].discount
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return sponItems.count
        }else{
            return Items.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            
            return CGSize(width: 120, height:200)
        }else{
            return CGSize(width: 185, height:310)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.item_id = Items[indexPath.item].item_id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return section.count
    }
    

    @objc func heartAction(_ sender: WCLShineButton){
        mainHeartDataManager().set_heart(self, item_id: sender.tag)
        
        
    }
    

    
    
}
extension MainViewController: FSPagerViewDelegate,FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return adImages.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = UIImage(named: adImages[index])
        
        return cell
    }
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pagecontrol.currentPage = targetIndex
    }
    
}
