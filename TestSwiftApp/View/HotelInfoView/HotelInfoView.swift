import UIKit
import x3Core
import x3UI

@IBDesignable
public class HotelInfoView: UIX3XibView {

    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var viewState: UIView?
    @IBOutlet public weak var imageState: UIImageView?
    @IBOutlet public weak var labelState: UILabel?
    @IBOutlet public weak var labelTitle: UILabel?
    @IBOutlet public weak var labelLocation: UILabel?
    
    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }

    public var item: HotelItem? {
        didSet {
            labelTitle?.text = item?.title
            labelLocation?.text = item?.location
            labelState?.text = item?.feedback

            self.invalidate()
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = Config.Colors.background
        self.layer.cornerRadius = 15.0
        
        viewState?.layer.cornerRadius = 5.0
        viewState?.backgroundColor = Config.Colors.backgroundExcelent
        imageState?.tintColor = Config.Colors.foregroundExcelent
        imageState?.image = Config.Images.iconStar
        labelState?.font = Config.Fonts.SFProDisplayMedium(size: 16.0)
        labelState?.textColor = Config.Colors.foregroundExcelent

        labelTitle?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
        labelTitle?.textColor = Config.Colors.textDark
        labelLocation?.font = Config.Fonts.SFProDisplayMedium(size: 14.0)
        labelLocation?.textColor = Config.Colors.tint


    }
    
    private func invalidate() {
        
    }
    
}

