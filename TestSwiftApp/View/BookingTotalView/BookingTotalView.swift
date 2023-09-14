import UIKit
import x3Core
import x3UI

@IBDesignable
public class BookingTotalView: UIX3XibView {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var labelTourCaption: UILabel?
    @IBOutlet public weak var labelTourValue: UILabel?

    @IBOutlet public weak var labelFuelSurchargeCaption: UILabel?
    @IBOutlet public weak var labelFuelSurchargeValue: UILabel?

    @IBOutlet public weak var labelServiceFeeCaption: UILabel?
    @IBOutlet public weak var labelServiceFeeValue: UILabel?

    @IBOutlet public weak var labelTotalCaption: UILabel?
    @IBOutlet public weak var labelTotalValue: UILabel?
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
        createLabel(label: labelTourCaption, text: "Тур".localized, color: Config.Colors.textDisabled, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelFuelSurchargeCaption, text: "Топливный сбор".localized, color: Config.Colors.textDisabled, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelServiceFeeCaption, text: "Сервисный сбор".localized, color: Config.Colors.textDisabled, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelTotalCaption, text: "К оплате".localized, color: Config.Colors.textDisabled, font: Config.Fonts.SFProDisplayRegular(size: 16))

        createLabel(label: labelTourValue, text: "186 600 ₽".localized, color: Config.Colors.textDark, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelFuelSurchargeValue, text: "9 300 ₽".localized, color: Config.Colors.textDark, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelServiceFeeValue, text: "2 136 ₽".localized, color: Config.Colors.textDark, font: Config.Fonts.SFProDisplayRegular(size: 16))
        createLabel(label: labelTotalValue, text: "198 036 ₽".localized, color: Config.Colors.tint, font: Config.Fonts.SFProDisplaySemibold(size: 16))
    }
    
    private func invalidate() {
    }
      
    private func createLabel(label: UILabel?, text: String?, color: UIColor?, font: UIFont?) {
        label?.text = text
        label?.textColor = color
        label?.font = font
    }

}
