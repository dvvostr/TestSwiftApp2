import UIKit
import x3Core
import x3UI

class FinishViewController: UIX3CustomViewController {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var imageView: UIImageView? {
        didSet {
            self.imageView?.backgroundColor = Config.Colors.backgroundGray
            self.imageView?.layer.cornerRadius = 47
            self.imageView?.layer.masksToBounds = true
            self.imageView?.image = Config.Images.imageFunny?.withInset(insets: 25.0)
        }
    }
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Ваш заказ принят в работу"
            self.labelCaption?.textColor = Config.Colors.textDark
            self.labelCaption?.font = Config.Fonts.SFProDisplayMedium(size: 22)
            
        }
    }
    @IBOutlet public weak var labelDesc: UILabel? {
        didSet {
            self.labelDesc?.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
            self.labelDesc?.textColor = Config.Colors.textDisabled
            self.labelDesc?.font = Config.Fonts.SFProDisplayRegular(size: 16)
        }
    }
    @IBOutlet public weak var buttonExecute: UIButton? {
       didSet {
           self.buttonExecute?.tintColor = Config.Colors.tint
           self.buttonExecute?.setBorderRadius(15)
           self.buttonExecute?.setTitle("Супер!".localized, for: UIControl.State.normal)
           self.buttonExecute?.titleLabel?.font = Config.Fonts.SFProDisplayMedium(size: 16)
           self.buttonExecute?.addTarget(self, action: #selector(FinishViewController.handleButtonExecuteClick), for: UIControl.Event.touchUpInside)
       }
   }
    override func setupView() {
        super.setupView()
        view.backgroundColor = Config.Colors.backgroundGray
    }
    override func navigationDidBack(_ isContinue: inout Bool) {
        isContinue = false
        handleButtonExecuteClick()
    }
    @objc private func handleButtonExecuteClick() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
