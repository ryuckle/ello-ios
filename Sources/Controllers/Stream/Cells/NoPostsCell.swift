////
///  NoPostsCell.swift
//

class NoPostsCell: UICollectionViewCell {
    static let reuseIdentifier = "NoPostsCell"

    @IBOutlet weak var noPostsHeader: UILabel!
    @IBOutlet weak var noPostsBody: UILabel!

    var isCurrentUser: Bool = false {
        didSet { updateText() }
    }

    func updateText() {
        let noPostsHeaderText: String
        let noPostsBodyText: String
        if isCurrentUser {
            noPostsHeaderText = InterfaceString.Profile.CurrentUserNoResultsTitle
            noPostsBodyText = InterfaceString.Profile.CurrentUserNoResultsBody
        }
        else {
            noPostsHeaderText = InterfaceString.Profile.NoResultsTitle
            noPostsBodyText = InterfaceString.Profile.NoResultsBody
        }

        noPostsHeader.text = noPostsHeaderText
        noPostsHeader.font = UIFont.regularBoldFont(18)
        let paragraphStyle = NSMutableParagraphStyle()
        let attrString = NSMutableAttributedString(string: noPostsBodyText)
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSRange(location: 0, length: attrString.length))
        paragraphStyle.lineSpacing = 4

        noPostsBody.font = UIFont.defaultFont()
        noPostsBody.attributedText = attrString
    }
}
