import UIKit
import x3Core
import x3UI

@IBDesignable
public class TouristAddView: UIX3XibView {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Добавить туриста".localized
            self.labelCaption?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
            self.labelCaption?.textColor = Config.Colors.textDark
        }
    }
    @IBOutlet public weak var buttonCaption: UIButton? {
        didSet {
            self.buttonCaption?.setImage(Config.Images.iconPlus)
            self.buttonCaption?.backgroundColor = Config.Colors.tint.withAlphaComponent(0.1)
            self.buttonCaption?.tintColor = Config.Colors.tint
            self.buttonCaption?.setBorderRadius(6.0)
            self.buttonCaption?.addTarget(self, action: #selector(TouristAddView.handleButtonClick), for: UIControl.Event.touchUpInside)
        }
    }
    
    public var onButtonClick: NotifyEvent?

    public var currentHeigth: CGFloat {
        get {
            return (self.conteinerView?.frame.height ?? 0.0)
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = Config.Colors.background
        self.layer.cornerRadius = 15.0
    }
    
    private func invalidate() {
    }
      
    @objc private func handleButtonClick() {
        self.onButtonClick?()
    }
}
