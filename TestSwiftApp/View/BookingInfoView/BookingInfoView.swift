import UIKit
import x3Core
import x3UI

@IBDesignable
public class BookingInfoView: UIX3XibView {
    @IBOutlet private weak var conteinerView: UIView?
    
    @IBOutlet private weak var labelDepartureCaption: UILabel?
    @IBOutlet private weak var labelDepartureValue: UILabel?
    @IBOutlet private weak var labelArrivalCaption: UILabel?
    @IBOutlet private weak var labelArrivalValue: UILabel?
    @IBOutlet private weak var labelDateCaption: UILabel?
    @IBOutlet private weak var labelDateValue: UILabel?
    @IBOutlet private weak var labelNightCountCaption: UILabel?
    @IBOutlet private weak var labelNightCountValue: UILabel?
    @IBOutlet private weak var labelHotelCaption: UILabel?
    @IBOutlet private weak var labelHotelValue: UILabel?
    @IBOutlet private weak var labelRoomCaption: UILabel?
    @IBOutlet private weak var labelRoomValue: UILabel?
    @IBOutlet private weak var labelNutritionCaption: UILabel?
    @IBOutlet private weak var labelNutritionValue: UILabel?
    
    @IBOutlet private weak var constraintRow1CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow2CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow3CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow4CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow5CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow6CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow7CaptionWidth: NSLayoutConstraint?

    public var onFrameUpadte: NotifyEvent?
    
    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }
    public var item: BookingInfoItem? {
        didSet {
            setValue(labelCaption: labelDepartureCaption, labelValue: labelDepartureValue, caption: "Вылет из".localized, value: self.item?.departure)
            setValue(labelCaption: labelArrivalCaption, labelValue: labelArrivalValue, caption: "Страна, город".localized, value: self.item?.arrival)
            setValue(labelCaption: labelDateCaption, labelValue: labelDateValue, caption: "Даты".localized, value: self.item?.date)
            setValue(labelCaption: labelNightCountCaption, labelValue: labelNightCountValue, caption: "Кол-во ночей".localized, value: self.item?.nightCount)
            setValue(labelCaption: labelHotelCaption, labelValue: labelHotelValue, caption: "Отель".localized, value: self.item?.hotel)
            setValue(labelCaption: labelRoomCaption, labelValue: labelRoomValue, caption: "Номер".localized, value: self.item?.room)
            setValue(labelCaption: labelNutritionCaption, labelValue: labelNutritionValue, caption: "Питание".localized, value: self.item?.nutrition)
            self.layoutIfNeeded()
            self.invalidate()
            onFrameUpadte?()
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = Config.Colors.background
        self.layer.cornerRadius = 15.0
    }
    private func setValue(labelCaption: UILabel?, labelValue: UILabel?, caption: String?, value: String?) {
        labelCaption?.textColor = Config.Colors.textDisabled
        labelCaption?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
        labelCaption?.text = caption
        labelValue?.textColor = Config.Colors.textDark
        labelValue?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
        labelValue?.text = value
    }
    
    public func invalidate() {
        let minValue: CGFloat = 52.0
        let a = labelDepartureCaption?.frame
        let b = labelDepartureCaption?.bounds
        let width = max(
            labelDepartureCaption?.frame.width ?? minValue,
            labelArrivalCaption?.frame.width ?? minValue,
            labelDateCaption?.frame.width ?? minValue,
            labelNightCountCaption?.frame.width ?? minValue,
            labelHotelCaption?.frame.width ?? minValue,
            labelRoomCaption?.frame.width ?? minValue,
            labelNutritionCaption?.frame.width ?? minValue
        )
        constraintRow1CaptionWidth?.constant = width
        constraintRow2CaptionWidth?.constant = width
        constraintRow3CaptionWidth?.constant = width
        constraintRow4CaptionWidth?.constant = width
        constraintRow5CaptionWidth?.constant = width
        constraintRow6CaptionWidth?.constant = width
        constraintRow7CaptionWidth?.constant = width
    }
       
}
