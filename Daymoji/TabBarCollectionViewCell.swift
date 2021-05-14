//
//  TabBarCollectionViewCell.swift
//  Daymoji
//
//  Created by 김성현 on 2021/05/13.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TabBarCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTitle(title: String) {
        titleLabel.text = title
        
    }
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .black
            } else {
                titleLabel.textColor = .lightGray }
            
        }
        
    }
    override func prepareForReuse() {
        isSelected = false
    }
    
    
    func setTabbar() {
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        let firstIndexPath = IndexPath(item: 0, section: 0)
        // delegate 호출
        collectionView(tabCollectionView, didSelectItemAt: firstIndexPath)
        // cell select
        tabCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right) }

}

