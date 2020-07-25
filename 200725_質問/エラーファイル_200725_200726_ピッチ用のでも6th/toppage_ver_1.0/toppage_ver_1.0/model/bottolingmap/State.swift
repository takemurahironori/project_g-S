//
//  State.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
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
