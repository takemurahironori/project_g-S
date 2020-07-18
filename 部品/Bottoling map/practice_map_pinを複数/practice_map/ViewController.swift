
import UIKit
import GoogleMaps

class ViewController: UIViewController {

    // You don't need to modify the default init(nibName:bundle:) method.
    


    let states = [
        state(name:"tokyo_station",long:139.767125,lat:35.681236),
        state(name:"hamamatsutyo_station",long:139.757129,lat:35.655381),
        state(name:"yurakutyo_station",long:139.762820,lat:35.674919)
    ]
    
    

    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 35.674919, longitude: 139.762820, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView

    
        for state in states {
            let state_marker = GMSMarker()
            state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
            state_marker.title = state.name
            state_marker.snippet = "Hey, this is \(state.name)"
            state_marker.map = mapView
        }
        

    }
    
}
