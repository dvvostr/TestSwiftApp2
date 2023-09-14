import UIKit
import x3Core
import x3UI

@IBDesignable

public class PropertyRow: UIX3XibView {
    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var labelCaption: UILabel?
    @IBOutlet public weak var labelValue: UILabel?

    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }
    public var captionWidth: CGFloat {
        get {
            return self.labelCaption?.frame.width ?? 0.0
        }
    }
    public var item: PropertyRowItem? {
        didSet {
            labelCaption?.text = item?.caption
            labelValue?.text = item?.value
            self.invalidate()
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = Config.Colors.background
        self.layer.cornerRadius = 15.0
    }
    
    private func invalidate() {
    }
       
}
