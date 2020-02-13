//
//  CategoriesModel.swift
//  Questions
//
//  Created by Admin on 2/8/20.
//  Copyright © 2020 Questions. All rights reserved.
//

import Foundation

class CategoriesModel : NSObject{
    var id = ""
    var name = ""
    var flag = ""
    
    override init(){
        super.init()
    }
    
    init(category: [String:Any]){
        if let val = category["_id"] as? String {id = val}
        if let val = category["name"] as? String {name = val}
        if let val = category["flag"] as? String {flag = val}
    }
}
