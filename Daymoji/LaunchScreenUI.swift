//
//  LaunchScreenUI.swift
//  Daymoji
//
//  Created by 김성현 on 2021/05/18.
//

import UIKit

class LaunchScreenUI : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatLabel()
    }
    
    private func creatLabel(){
        let label = UILabel(frame: CGRect(x:0,y:0,width:300,height:100))
        view.addSubview(label)
        label.text = "DAJMOJI"
        label.textAlignment = .center
        label.center = view.center
    }
    
}
