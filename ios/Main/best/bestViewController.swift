//
//  bestViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class bestViewController: UIViewController, UICollectionViewDataSource {
    let images:[String] = ["반팔1","반팔2","반팔3","반팔4","반팔5","반팔6","반팔7","반팔8","스커트6","스커트7","스커트8","아우터2","아우터3","아우터4","패딩1","패딩2","스커트","아우터1","데님1","바지2","바지3","바지4","셔츠1","셔츠3","셔츠4","스커트2","스커트3","스커트4","스커트5","아우터1","원피스1","원피스2","원피스3","가디건1","가디건2","가디건3","가디건4","가디건5","가디건6"]
    var sponItems:[items] = [
        items(item_id: 2, item_category: "상의", item_category_detail: "티셔츠", item_image: nil, is_free_ship: "N", is_heart: "N", mall_name: "오브로밍", item_name: "브이넥 셔링 크롭 반팔", discount: "0%", price: "21,000"),
        items(item_id: 1, item_category: "원피스/세트", item_category_detail: "롱원피스", item_image: nil, is_free_ship: "N", is_heart: "N", mall_name: "기프티박스", item_name: "메기 린넨 스퀘어넥", discount: "0%", price: "15,900"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000"),
        items(item_id: 7, item_category: "상의", item_category_detail: "블라우스", item_image: nil, is_free_ship: "N", is_heart: "Y", mall_name: "러블리감성", item_name: "봄 샌디 롱 트렌치코트", discount: "12%", price: "67,000")
        
    ]
    let buttonTitles:[String]! = ["전체","아우터","상의","원피스","바지","스커트","슈즈","가방","액세서리","패션소품","비치웨어","란제리","트레이닝","빅사이즈"]
    var btnScroll:UIScrollView!
    let buttonPadding:CGFloat = 4
    var xOffset:CGFloat = 5
    @IBOutlet weak var itemCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnScroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.layer.bounds.width + 40, height: 90))
        self.view.addSubview(btnScroll)
        
        btnScroll.backgroundColor = .white
        btnScroll.showsHorizontalScrollIndicator = false
        for i in 0 ... buttonTitles.count-1 {
            let button = UIButton()
            button.tag = i
            button.setTitle(buttonTitles[i], for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
            if i == 0 {
                button.setTitleColor(.black, for: .normal)
            }else{
                button.setTitleColor(.systemGray3, for: .normal)
            }
            if i > 7 {
                button.frame = CGRect(x: xOffset, y: 50, width: 65, height: 45)
            } else {
                button.frame = CGRect(x: xOffset, y: 50, width: 47, height: 45)
            }
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            btnScroll.addSubview(button)
        }
        btnScroll.contentSize = CGSize(width: xOffset, height: btnScroll.frame.height)
        
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 7, left: 17, bottom: 10, right:17)
          itemCollection.collectionViewLayout = layout
          
          let itemCellNib = UINib(nibName: "itemCollectionViewCell", bundle: nil)
          self.itemCollection.register(itemCellNib, forCellWithReuseIdentifier: "item")
          self.itemCollection.delegate = self
          self.itemCollection.dataSource = self
    }
    
  
    
    
}
extension bestViewController:UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionItem:[[items]] = [sponItems]
        let cell = itemCollection.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCollectionViewCell
        
        
        
        cell.item_image.frame = CGRect(x: 0, y: 0, width: 185, height: 225)
        cell.item_image.image = UIImage(named: images[indexPath.row])
        cell.item_name.text = sectionItem[indexPath.section][indexPath.item].item_name
        cell.mall_name.text = sectionItem[indexPath.section][indexPath.item].mall_name
        cell.mall_name.layer.zPosition = 1
        if sectionItem[indexPath.section][indexPath.item].is_free_ship == "Y" {
            cell.free_ship.text = "무료배송"
        }else{
            cell.free_ship.text = ""
            cell.free_ship.isHidden = true
        }
        cell.free_ship.layer.zPosition = 1
        cell.price.text = sectionItem[indexPath.section][indexPath.item].price
        cell.item_id = sectionItem[indexPath.section][indexPath.item].item_id
        cell.superController = self
        cell.discount.text = sectionItem[indexPath.section][indexPath.item].discount
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return sponItems.count
        }else{
            return sponItems.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: 185, height:310)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailVC = detailViewController()
            detailVC.item_id = sponItems[indexPath.item].item_id
            self.navigationController?.pushViewController(detailVC, animated: true)
            
    }
    }
    
    
