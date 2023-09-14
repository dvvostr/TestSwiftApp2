import UIKit
import x3Core
import x3UI
import ImageSlideshow
import TagListView

class RoomSelectViewCell: UICollectionViewCell {
    @IBOutlet public weak var view: UIView?
   
    @IBOutlet public weak var viewSlideShow: ImageSlideshow?

    @IBOutlet public weak var viewRoomAbout: UIView?
    @IBOutlet public weak var labelRoomAbout: UILabel?
    @IBOutlet public weak var imageRoomAbout: UIImageView?

    @IBOutlet public weak var viewTagList: TagListView?

    @IBOutlet public weak var labelRoomTitle: UILabel?
    @IBOutlet public weak var labelRoomPrice: UILabel?
    @IBOutlet public weak var labelRoomPriceDesc: UILabel?

    @IBOutlet public weak var buttonChoise: UIButton? {
       didSet {
           self.buttonChoise?.tintColor = Config.Colors.tint
           self.buttonChoise?.setBorderRadius(15)
           self.buttonChoise?.setTitle("Выбрать номер".localized, for: UIControl.State.normal)
           self.buttonChoise?.titleLabel?.font = Config.Fonts.SFProDisplayMedium(size: 16)
           self.buttonChoise?.addTarget(self, action: #selector(RoomSelectViewCell.handleButtonClick), for: UIControl.Event.touchUpInside)
       }
    }

    private var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.pageIndicatorTintColor = Config.Colors.controlInactive
        view.currentPageIndicatorTintColor = Config.Colors.controlActive
        
        if let view = view.subviews.first {
            view.backgroundColor = Config.Colors.background.withAlphaComponent(0.80)
            view.layer.cornerRadius = 5.0
        }
        return view
    } ()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view?.backgroundColor = Config.Colors.background
        view?.layer.cornerRadius = 12.0
        
        viewSlideShow?.layer.cornerRadius = 15.0
        viewSlideShow?.slideshowInterval = 5.0
        viewSlideShow?.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        viewSlideShow?.contentScaleMode = UIViewContentMode.scaleToFill
        viewSlideShow?.pageIndicator = pageControl
        viewSlideShow?.pageIndicatorPosition = PageIndicatorPosition(vertical: .bottom)
        viewSlideShow?.activityIndicator = DefaultActivityIndicator()
        viewSlideShow?.delegate = self
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleImageClick))
        viewSlideShow?.addGestureRecognizer(recognizer)


        viewRoomAbout?.layer.cornerRadius = 5.0
        viewRoomAbout?.backgroundColor = Config.Colors.tint.getAlphaColor(0.1)
        imageRoomAbout?.tintColor = Config.Colors.tint
        imageRoomAbout?.image = Config.Images.iconChevronRight?.withRenderingModeTemplate
        labelRoomAbout?.font = Config.Fonts.SFProDisplayMedium(size: 16.0)
        labelRoomAbout?.textColor = Config.Colors.tint
        labelRoomAbout?.text = "\("Подробнее о номере".localized)"

        labelRoomTitle?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
        labelRoomTitle?.textColor = Config.Colors.textDark
        labelRoomPrice?.font = Config.Fonts.SFProDisplayMedium(size: 30.0)
        labelRoomPrice?.textColor = Config.Colors.textDark
        labelRoomPriceDesc?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
        labelRoomPriceDesc?.textColor = Config.Colors.textDisabled

        viewTagList?.textFont = UIFont.systemFont(ofSize: 24)
        viewTagList?.tagBackgroundColor = Config.Colors.backgroundGray
        viewTagList?.cornerRadius = 5.0
        viewTagList?.textColor = Config.Colors.textDisabled
        viewTagList?.textFont = Config.Fonts.SFProDisplayMedium(size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
        viewTagList?.paddingY = 5.0
        viewTagList?.paddingX = 10.0
        viewTagList?.marginX = 4.0
        viewTagList?.marginY = 4.0
        viewTagList?.alignment = .leading
    }

    public var onItemClick: ObjectEvent?
    
    public var item: RoomSelectListItem? {
        didSet {
            var imageSource: [BundleImageSource] = []
            item?.images.forEach({
                imageSource.append(BundleImageSource(imageString: $0))
            })
            viewSlideShow?.setImageInputs(imageSource)
            labelRoomTitle?.text = item?.title
            labelRoomPrice?.text = (item?.price ?? 0.0) > 0 ? "\(item!.price) ₽" : ""
            labelRoomPriceDesc?.text = item?.priceDesc ?? ""
            viewTagList?.removeAllTags()
            viewTagList?.addTags(item?.tags ?? [])
        }
    }
    
    @objc func handleImageClick() {
    }
    @objc private func handleButtonClick() {
        self.onItemClick?(self.item)
    }
}
extension RoomSelectViewCell: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
//        print("current page:", page)
    }
}
