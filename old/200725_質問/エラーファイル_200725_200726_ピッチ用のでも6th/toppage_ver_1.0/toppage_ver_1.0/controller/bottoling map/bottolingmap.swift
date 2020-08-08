//
//  bottolingmap.swift
//  toppage_ver_1.0
//
//  Created by 竹村博徳 on 2020/07/19.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import UIKit
import GoogleMaps

class bottolingmapController: UIViewController {

    // You don't need to modify the default init(nibName:bundle:) method.
    


    let states = [
        state(name:"Bar Pero",long:139.712659,lat:35.561898),
        state(name:"Bar Journey Kamata Rock & Jazz Vinyl bar",long:139.719601,lat:35.561862),
        state(name:"Bar doop",long:139.715357,lat:35.56335),
        state(name:"ショットバーふくろう",long:139.719109,lat:35.561977),
        state(name:"BAR PADRE",long:139.718325,lat:35.562463),
        state(name:"バー大女優",long:139.719054,lat:35.562233),
        state(name:"タイム Bar Time",long:139.720401,lat:35.561952),
        state(name:"Bar Diavolo（バーディアボロ）",long:139.722632,lat:35.561581),
        state(name:"ショットバー グレイル",long:139.719001,lat:35.563143),
        state(name:"BARCHEFTENDER バーシェフテンダー",long:139.715485,lat:35.563959),
        state(name:"蒲田のダイニングバーEMPORIO",long:139.710061,lat:35.562303)
        
    ]
    
    

    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 35.561898, longitude: 139.712659, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView

    
        for state in states {
            let state_marker = GMSMarker()
            state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
            state_marker.title = state.name
            state_marker.snippet = "ボトリング可能なバーです \(state.name)"
            state_marker.map = mapView
        }
        

    }
    
}
