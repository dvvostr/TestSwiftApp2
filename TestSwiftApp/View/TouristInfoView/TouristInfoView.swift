import UIKit
import x3Core
import x3UI

@IBDesignable

public class TouristInfoView: UIX3XibView {
    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var headerView: UIView?
    @IBOutlet public weak var bodyView: UIView?
    
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Турист".localized
            self.labelCaption?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
            self.labelCaption?.textColor = Config.Colors.textDark
        }
    }
    @IBOutlet public weak var buttonCaption: UIButton? {
        didSet {
            self.buttonCaption?.setImage(Config.Images.iconChevronUp)
            self.buttonCaption?.backgroundColor = Config.Colors.tint.withAlphaComponent(0.1)
            self.buttonCaption?.tintColor = Config.Colors.tint
            self.buttonCaption?.setBorderRadius(6.0)
            self.buttonCaption?.addTarget(self, action: #selector(TouristInfoView.handleButtonClick), for: UIControl.Event.touchUpInside)
        }
    }
    
    @IBOutlet private weak var viewTouristName1: UIView?
    @IBOutlet private weak var labelTouristName1: UILabel?
    @IBOutlet private weak var inputTouristName1: UITextField?
    
    @IBOutlet private weak var viewTouristName2: UIView?
    @IBOutlet private weak var labelTouristName2: UILabel?
    @IBOutlet private weak var inputTouristName2: UITextField?

    @IBOutlet private weak var viewBornDate: UIView?
    @IBOutlet private weak var inputBornDate: UITextField?
    
    @IBOutlet private weak var viewCitizenship: UIView?
    @IBOutlet private weak var inputCitizenship: UITextField?
    
    @IBOutlet private weak var viewPassportNum: UIView?
    @IBOutlet private weak var inputPassportNum: UITextField?
    
    @IBOutlet private weak var viewPassportDate: UIView?
    @IBOutlet private weak var inputPassportdate: UITextField?
    @IBOutlet public weak var constraintBodyViewTop: NSLayoutConstraint?
    
    public var onFrameUpadte: NotifyEvent?
    public var onButtonClick: NotifyEvent?

    
    public var currentHeigth: CGFloat {
        get {
            return (self.conteinerView?.frame.height ?? 0.0)
        }
    }
    public var isExpended: Bool {
        get { return (self.constraintBodyViewTop?.constant ?? -1.0) == 0.0 }
    }
    public var bodyHeight: CGFloat? {
        get { return (self.bodyView?.frame.height) }
    }
    
    public override func setupView() {
        super.setupView()
        self.backgroundColor = Config.Colors.background
        self.layer.cornerRadius = 15.0
        createInputCaption(label: labelTouristName1, text: "Имя".localized)
        createView(view: viewTouristName1)
        createInputField(input: inputTouristName1, placeholder: nil, value: "Иван".localized, keyboardType: .default)
        createInputCaption(label: labelTouristName2, text: "Фамилия".localized)
        createView(view: viewTouristName2)
        createInputField(input: inputTouristName2, placeholder: nil, value: "Иванов".localized, keyboardType: .default)
        createView(view: viewBornDate)
        createInputField(input: inputBornDate, placeholder: "Дата рождения".localized, value: nil, keyboardType: .default)
        createView(view: viewCitizenship)
        createInputField(input: inputCitizenship, placeholder: "Гражданство", value: nil, keyboardType: .default)
        createView(view: viewPassportDate)
        createInputField(input: inputPassportdate, placeholder: "Срок действия загранпаспорта".localized, value: nil, keyboardType: .default)
        createView(view: viewPassportNum)
        createInputField(input: inputPassportNum, placeholder: "Номер загранпаспорта".localized, value: nil, keyboardType: .default)
    }
    
    private func invalidate() {
    }
    private func createView(view: UIView?) {
        view?.backgroundColor = Config.Colors.backgroundGray
        view?.layer.cornerRadius = 10.0
        view?.layer.masksToBounds = true
    }
      
    private func createInputCaption(label: UILabel?, text: String) {
        label?.textColor = Config.Colors.textDisabled
        label?.font = Config.Fonts.SFProDisplayRegular(size: 12.0)
        label?.text = text
    }
    private func createInputField(input: UITextField?, placeholder: String?, value: String?, keyboardType: UIKeyboardType) {
        input?.backgroundColor = UIColor.clear
        input?.borderStyle = .none
        input?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
        input?.keyboardType = keyboardType
        input?.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: Config.Colors.textDisabled ?? UIColor.darkText.withAlphaComponent(0.4),
                NSAttributedString.Key.font: Config.Fonts.SFProDisplayRegular(size: 17) ?? UIFont.systemFont(ofSize: 17)
            ]
        )
        input?.text = value
    }
    @objc private func handleButtonClick() {
        self.onButtonClick?()
    }
}
