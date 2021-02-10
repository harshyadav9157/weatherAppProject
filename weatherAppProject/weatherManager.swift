//
//  weatherManager.swift
//  weatherAppProject
//
//  Created by harsh yadav on 29/12/20.
//

import Foundation
import SwiftyJSON
import Foundation

struct weatherManger {
    var name : String = " "
    
    init(){
        
    }
    
    init(json:JSON) {
        name = json["name"].stringValue
    }
}
