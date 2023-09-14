import Foundation

@objc open class CustomListDataItem: CustomDataResult {
    @objc public var code: String = ""
    @objc public var caption: String = ""
    
    enum CodingKeys: String, CodingKey {
        case code
        case caption
    }
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try _container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.caption = try _container.decodeIfPresent(String.self, forKey: .caption) ?? ""
    }
    public required override init() {
        super.init()
    }
    public required init(data: NSDictionary?) {
        super.init()
        self.code = data?["code"] as? String ?? ""
        self.caption = data?["caption"] as? String ?? ""
    }
}
