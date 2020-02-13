//
//  ProgressHud.swift
//  Questions
//
//  Created by Admin on 2/8/20.
//  Copyright © 2020 Questions. All rights reserved.
//

import UIKit
import JGProgressHUD

class ProgressHud{
    
    static let shared = ProgressHud()
    let hud = JGProgressHUD(style: .light)
    
    private init(){}
    
    func show(view: UIView, msg: String){
        hud.textLabel.text = msg
        hud.show(in: view)
    }
    
    func dismiss(){
        hud.dismiss()
    }
}
