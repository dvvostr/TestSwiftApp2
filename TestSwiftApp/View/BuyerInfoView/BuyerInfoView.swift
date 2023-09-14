import UIKit
import x3Core
import x3UI

@IBDesignable

public class BuyerInfoView: UIX3XibView {
    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.textColor = Config.Colors.textDark
            self.labelCaption?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
            self.labelCaption?.text = "Информация о покупателе".localized
        }
    }
    @IBOutlet public weak var viewPhone: UIView? {
        didSet {
            self.viewPhone?.backgroundColor = Config.Colors.backgroundGray
            self.viewPhone?.layer.cornerRadius = 10.0
            self.viewPhone?.layer.masksToBounds = true
        }
    }
    @IBOutlet public weak var labelInputPhoneCaption: UILabel? {
        didSet {
            self.labelInputPhoneCaption?.textColor = Config.Colors.textDisabled
            self.labelInputPhoneCaption?.font = Config.Fonts.SFProDisplayRegular(size: 12.0)
            self.labelInputPhoneCaption?.text = "Номер телефона"
        }
    }
    @IBOutlet public weak var inputPhone: UITextField? {
        didSet{
            self.inputPhone?.backgroundColor = UIColor.clear
            self.inputPhone?.borderStyle = .none
            self.inputPhone?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
            self.inputPhone?.keyboardType = .phonePad
            self.inputPhone?.text = "+7 (951) 555-99-00"
        }
    }
    @IBOutlet public weak var labelInputEmailCaption: UILabel? {
        didSet {
            self.labelInputPhoneCaption?.textColor = Config.Colors.textDisabled
            self.labelInputPhoneCaption?.font = Config.Fonts.SFProDisplayRegular(size: 12.0)
            self.labelInputPhoneCaption?.text = "Почта"
        }
    }
    @IBOutlet public weak var viewEmail: UIView? {
        didSet {
            self.viewEmail?.backgroundColor = Config.Colors.backgroundGray
            self.viewEmail?.layer.cornerRadius = 10.0
            self.viewEmail?.layer.masksToBounds = true
        }
    }
    @IBOutlet public weak var inputEmail: UITextField? {
        didSet {
            self.inputEmail?.backgroundColor = UIColor.clear
            self.inputEmail?.borderStyle = .none
            self.inputEmail?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
            self.inputEmail?.keyboardType = .emailAddress
            self.inputEmail?.text = "examplemail.000@mail.ru"
        }
    }
    @IBOutlet public weak var labelDesc: UILabel? {
        didSet {
            self.labelDesc?.textColor = Config.Colors.textDisabled
            self.labelDesc?.font = Config.Fonts.SFProDisplayRegular(size: 14.0)
            self.labelDesc?.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту".localized
        }
    }

    public var onFrameUpadte: NotifyEvent?
    
    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }
    public var item: PropertyRowItem? {
        didSet {
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
