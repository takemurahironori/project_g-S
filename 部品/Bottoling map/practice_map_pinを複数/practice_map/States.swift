//
//  States.swift
//  practice_map
//
//  Created by 竹村博徳 on 2020/07/11.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class state {
    let name: String
    let long: CLLocationDegrees
    let lat: CLLocationDegrees
    
    init(name:String, long:CLLocationDegrees, lat:CLLocationDegrees){
        self.name = name
        self.long = long
        self.lat = lat
        
        
        
    }
}
