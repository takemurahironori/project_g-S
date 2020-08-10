import UIKit
import FoldingCell

class SampleCell: FoldingCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clear
    }

    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}
