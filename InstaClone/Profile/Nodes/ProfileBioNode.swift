//
//  ProfileBioNode.swift
//  InstaClone
//
//  Created by Philip Martin on 04/05/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ProfileBioNode: BaseNode, ASTextNodeDelegate {
    
    private var kLinkAttributeName = "websiteAttribute"
    let bio = "#mariokart enthusiast and father of 2 great kids, I also run a Youtube channel, which I share coding tutorials on how to build apps from scratch"
    
    let link = "https://google.com"
    var nameNode = ASTextNode()
    var bioNode = ASTextNode()
    var website = ASTextNode2()
    var editProfileButton = ASButtonNode()
    
    //MARL: - Initaliser
    override init() {
        super.init()
        self.isUserInteractionEnabled = true
//        setupNodes()
    }
    
    //MARK: - Layout Spec
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let buttonInset = ASInsetLayoutSpec(insets: .init(top: 10, left: 0, bottom: 0, right: 0), child: editProfileButton)
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .stretch, children: [nameNode, bioNode, website, buttonInset])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 10, bottom: 10, right: 10), child: stack)
    }
    
    //MARK: - View Setup
    func populate() {
        nameNode.attributedText = NSAttributedString(string: "Phil Martin - iOS Developer", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        bioNode.attributedText = NSAttributedString(string: bio, attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        setupWebsiteTextNode()
        setupEditProfileNode()
    }
    
    private func setupWebsiteTextNode() {
        website.isUserInteractionEnabled = true
        website.delegate = self
        let attributedString = NSMutableAttributedString(string: link)
        let range = link.range(of: "https://google.com")!
        attributedString.addAttributes([.link: URL(string: link)!,.font: UIFont.boldSystemFont(ofSize: 12), .foregroundColor: UIColor.label], range: NSRange(range, in: link))
        website.attributedText = attributedString
        website.linkAttributeNames = [NSAttributedString.Key.link.rawValue]
    }
    
    private func setupEditProfileNode() {
        editProfileButton.cornerRadius = 5
        editProfileButton.contentEdgeInsets = .init(top: 7, left: 0, bottom: 7, right: 0)
        editProfileButton.setTitle("Edit Profile", with: UIFont.systemFont(ofSize: 12), with: .label, for: .normal)
        editProfileButton.borderColor = UIColor.label.cgColor
        editProfileButton.borderWidth = 0.5
    }
    
    //MARK: - Delegate
    func textNode(_ textNode: ASTextNode!, tappedLinkAttribute attribute: String!, value: Any!, at point: CGPoint, textRange: NSRange) {
        if let url = value{
            UIApplication.shared.open(URL(string: "\(url)")!, options: [:], completionHandler: nil)
        }
    }
    
}
