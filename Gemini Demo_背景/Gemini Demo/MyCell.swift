

import UIKit
import Gemini

class MyCell: GeminiCell {
    
    @IBOutlet weak private var mainImageView: UIImageView!
    
    func setCell(imageName:String) {
        
        mainImageView.image = UIImage(named: imageName)
    }
    
}
