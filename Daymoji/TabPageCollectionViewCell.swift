//
//  TabPageCollectionViewCell.swift
//  Daymoji
//
//  Created by 김성현 on 2021/05/13.
//

import UIKit
class TabPageCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TabPageCell"
    lazy var backColor: [UIColor] = [.lightGray, .purple, .orange, .cyan, .magenta]
   
    func setColor(index: Int){
        self.backgroundColor = backColor[index]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCollectionView { highlightView.translatesAutoresizingMaskIntoConstraints = false constraints = [
            highlightView.leadingAnchor.constraint(equalTo: cell.leadingAnchor), highlightView.trailingAnchor.constraint(equalTo: cell.trailingAnchor) ]
            NSLayoutConstraint.activate(constraints)
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
                
            }
            
        }
        
    }

    
}
