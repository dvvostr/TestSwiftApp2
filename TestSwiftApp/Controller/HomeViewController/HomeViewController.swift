import UIKit
import x3Core
import x3UI
import Alamofire
import ImageSlideshow
import TagListView

class HomeViewController: UIX3CustomViewController {
    private let localSource = [BundleImageSource(imageString: "slideImage1"), BundleImageSource(imageString: "slideImage2"), BundleImageSource(imageString: "slideImage3")]

    @IBOutlet public weak var scrollView: UIScrollView? {
        didSet {
            self.scrollView?.backgroundColor = UIColor.clear
        }
    }
    @IBOutlet public weak var scrollContainerView: UIView? {
        didSet {
            self.scrollContainerView?.backgroundColor = Config.Colors.backgroundGray
        }
    }
    @IBOutlet public weak var viewContentTop: UIView? {
        didSet {
            self.viewContentTop?.backgroundColor = Config.Colors.background
        }
    }
    
    @IBOutlet public weak var scrollViewHeigthConstraint: NSLayoutConstraint?
    
    @IBOutlet public weak var viewBotton: UIView?

    @IBOutlet public weak var viewSlideShow: ImageSlideshow?
    @IBOutlet public weak var stateContentView: UIView?
    @IBOutlet public weak var stateImageView: UIImageView?
    @IBOutlet public weak var stateLabeCaption: UILabel?
    @IBOutlet public weak var topLabelHotelName: UILabel?
    @IBOutlet public weak var topLabelHotelLocation: UILabel?
    @IBOutlet public weak var topLabelHotelPrice: UILabel?
    @IBOutlet public weak var topLabelHotelPriceDesc: UILabel?

    @IBOutlet public weak var viewAboutContainer: UIView?
    @IBOutlet public weak var labelAboutCaption: UILabel?
    @IBOutlet public weak var viewAboutTagList: TagListView?
    @IBOutlet public weak var labelAboutDesc: UILabel?
    @IBOutlet public weak var viewAboutFutures: UIView?
    @IBOutlet public weak var viewAboutFuturesStack: UIStackView?


    @IBOutlet public weak var buttonChoise: UIButton? {
       didSet {
           self.buttonChoise?.tintColor = Config.Colors.tint
           self.buttonChoise?.setBorderRadius(15)
           self.buttonChoise?.setTitle("To select a room".localized, for: UIControl.State.normal)
           self.buttonChoise?.titleLabel?.font = Config.Fonts.SFProDisplayMedium(size: 16)
           self.buttonChoise?.addTarget(self, action: #selector(HomeViewController.handleButtonChoiseClick), for: UIControl.Event.touchUpInside)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.captionFont = Config.Fonts.SFProDisplayMedium(size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)
        self.captionText = "Hotel".localized
        self.navigationItem.leftBarButtonItems = []
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = Config.Colors.background
        
        viewSlideShow?.layer.cornerRadius = 15.0
        viewSlideShow?.slideshowInterval = 5.0
        viewSlideShow?.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        viewSlideShow?.contentScaleMode = UIViewContentMode.scaleToFill
        viewSlideShow?.pageIndicator = pageControl
//        viewSlideShow?.pageControlPosition = .insideScrollView //.custom(padding: 16.0)
        viewSlideShow?.pageIndicatorPosition = PageIndicatorPosition(vertical: .bottom)
        viewSlideShow?.activityIndicator = DefaultActivityIndicator()
        viewSlideShow?.delegate = self
        viewSlideShow?.setImageInputs(localSource)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.handleImageClick))
        viewSlideShow?.addGestureRecognizer(recognizer)


        stateContentView?.layer.cornerRadius = 5.0
        stateContentView?.backgroundColor = Config.Colors.backgroundExcelent
        stateImageView?.tintColor = Config.Colors.foregroundExcelent
        stateImageView?.image = Config.Images.iconStar
        stateLabeCaption?.font = Config.Fonts.SFProDisplayMedium(size: 16.0)
        stateLabeCaption?.textColor = Config.Colors.foregroundExcelent
        stateLabeCaption?.text = "\(5) \("Perfect".localized)"

        topLabelHotelName?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
        topLabelHotelName?.textColor = Config.Colors.textDark
        topLabelHotelLocation?.font = Config.Fonts.SFProDisplayMedium(size: 14.0)
        topLabelHotelLocation?.textColor = Config.Colors.tint
        topLabelHotelPrice?.font = Config.Fonts.SFProDisplayMedium(size: 30.0)
        topLabelHotelPrice?.textColor = Config.Colors.textDark
        topLabelHotelPriceDesc?.font = Config.Fonts.SFProDisplayRegular(size: 16.0)
        topLabelHotelPriceDesc?.textColor = Config.Colors.textDisabled

        topLabelHotelName?.text = "Steigenberger Makadi".localized
        topLabelHotelLocation?.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет".localized
        topLabelHotelPrice?.text = "от 134 673 ₽"
        topLabelHotelPriceDesc?.text = "за тур с перелётом"
        
        viewAboutContainer?.backgroundColor = Config.Colors.background
        viewAboutContainer?.layer.cornerRadius = 12.0
        
        labelAboutCaption?.font = Config.Fonts.SFProDisplayMedium(size: 22.0)
        labelAboutCaption?.textColor = Config.Colors.textDark
        labelAboutCaption?.text = "Об отеле".localized

        viewAboutTagList?.textFont = UIFont.systemFont(ofSize: 24)
        viewAboutTagList?.tagBackgroundColor = Config.Colors.backgroundGray
        viewAboutTagList?.cornerRadius = 5.0
        viewAboutTagList?.textColor = Config.Colors.textDisabled
        viewAboutTagList?.textFont = Config.Fonts.SFProDisplayMedium(size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
        viewAboutTagList?.paddingY = 5.0
        viewAboutTagList?.paddingX = 10.0
        viewAboutTagList?.marginX = 4.0
        viewAboutTagList?.marginY = 4.0
        
        viewAboutTagList?.alignment = .leading // possible values are [.leading, .trailing, .left, .center, .right]
        viewAboutTagList?.addTags(["3-я линия".localized, "Платный Wi-Fi в фойе".localized, "30 км до аэропорта".localized, "1 км до пляжа".localized])

        labelAboutDesc?.font = Config.Fonts.SFProDisplayMedium(size: 16.0)
        labelAboutDesc?.textColor = Config.Colors.textDark
        labelAboutDesc?.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!".localized

        viewAboutFutures?.backgroundColor = Config.Colors.backgroundGray
        viewAboutFutures?.layer.cornerRadius = 15.0
        createFutures(view: viewAboutFuturesStack, values: [
            HotelFutureItem(id: 1, title: "Удобства".localized, desc: "Самое необходимое".localized, image: Config.Images.IMAGE_ICONEMOJIHAPPY),
            HotelFutureItem(id: 2, title: "Что включено".localized, desc: "Самое необходимое".localized, image: Config.Images.IMAGE_ICONTICKSQUARE),
            HotelFutureItem(id: 3, title: "Что не включено".localized, desc: "Самое необходимое".localized, image: Config.Images.IMAGE_ICONCLOSESQUARE),
        ])
    }

    @objc func handleImageClick() {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewSlideShow?.pageIndicator?.view.constraintValue(NSLayoutConstraint.Attribute.height, constant: 17.0)
        
    }
    private func createFutures(view: UIStackView?, values: [HotelFutureItem]) {
        view?.arrangedSubviews.forEach({ item in
            view?.removeArrangedSubview(item)
            item.removeFromSuperview()
        })
        view?.axis = .vertical
        view?.distribution = .fillEqually
        view?.alignment = .fill
        view?.spacing = 0.0
        view?.translatesAutoresizingMaskIntoConstraints = false
        values.forEach({ item in
            let row = UIView()
            let image = UIImageView(image: UIImage(named: item.image)?.withRenderingModeTemplate)
            image.tintColor = Config.Colors.textDark
            row.addSubview(image)
            image.anchorCenterYToSuperview(constant: 0)
            image.anchor(nil, left: row.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
            let chevron = UIImageView(image: Config.Images.iconChevronRight)
            row.addSubview(chevron)
            chevron.tintColor = Config.Colors.textDark
            chevron.anchorCenterYToSuperview(constant: 0)
            chevron.anchor(nil, left: nil, bottom: nil, right: row.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 6, heightConstant: 12)
            let title = UILabel()
            row.addSubview(title)
            title.textColor = Config.Colors.textDark
            title.font = Config.Fonts.SFProDisplayMedium(size: 16.0)
            title.text = item.title
            title.anchor(row.topAnchor, left: image.rightAnchor, bottom: row.centerYAnchor, right: chevron.leftAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
            let desc = UILabel()
            row.addSubview(desc)
            desc.textColor = Config.Colors.textDisabled
            desc.font = Config.Fonts.SFProDisplayMedium(size: 14.0)
            desc.text = item.desc
            desc.anchor(row.centerYAnchor, left: image.rightAnchor, bottom: row.bottomAnchor, right: chevron.leftAnchor, topConstant: 2, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)

            if (values.index(of: item) ?? 0 < values.count - 1) {
                let separator = UIView()
                row.addSubview(separator)
                separator.backgroundColor = Config.Colors.textDisabled.getAlphaColor(0.3)
                separator.anchor(nil, left: desc.leftAnchor, bottom: row.bottomAnchor, right: chevron.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
            }
            view?.addArrangedSubview(row)
        })
        
    }
}
extension HomeViewController {
    @objc private func handleButtonChoiseClick() {
        let controller = RoomSelectViewController.fromNib()
        controller.captionFont = Config.Fonts.SFProDisplayMedium(size: 18) ?? UIFont.systemFont(ofSize: 18)
        controller.captionText = "Steigenberger Makadi".localized
        let items: [RoomSelectListItem] = [
            RoomSelectListItem(id: 1, object: 1, title: "Стандартный с видом на бассейн или сад 1".localized, images: ["slideImage1", "slideImage2","slideImage3"], tags: ["Все включено 1", "Кондиционер 1"], price: 186600, priceDesc: "за 5 ночей с перелётом".localized),
            RoomSelectListItem(id: 2, object: 1, title: "Не совсем стандартный с видом на бассейн, сад и поле для гольфа".localized, images: ["slideImage1", "slideImage2","slideImage3"], tags: ["Все включено 2", "Кондиционер 2", "Телевизор 2", "Сейф 2", "И все такое 2"], price: 186700, priceDesc: "за 6 ночей с перелётом".localized),
            RoomSelectListItem(id: 3, object: 1, title: "Проверка длинного текста для заголовка номера отеля. Здесь должен был быть очень длинный текст, но можно было бы ограничиться менее длинным и более коротким".localized, images: ["slideImage1", "slideImage2","slideImage3"], tags: ["Все включено 3", "Кондиционер 3"], price: 186800, priceDesc: "за 7 ночей с перелётом".localized),
            RoomSelectListItem(id: 4, object: 1, title: "Стандартный с видом на бассейн или сад 4".localized, images: ["slideImage1", "slideImage2","slideImage3"], tags: ["Все включено 4", "Кондиционер 4"], price: 186900, priceDesc: "за 8 ночей с перелётом".localized),
            RoomSelectListItem(id: 5, object: 1, title: "Стандартный с видом на бассейн или сад 5".localized, images: ["slideImage1", "slideImage2","slideImage3"], tags: ["Все включено 5", "Кондиционер 5"], price: 187000, priceDesc: "за 9 ночей с перелётом".localized)        ]
        controller.loadData(hotel: HotelItem(id: -1, title: self.topLabelHotelName?.text, location: topLabelHotelLocation?.text, feedback: stateLabeCaption?.text), items: items) { result, data in
            if result.isSuccess {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
//        print("current page:", page)
    }
}
