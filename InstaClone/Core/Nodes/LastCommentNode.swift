//
//  LastCommentNode.swift
//  InstaClone
//
//  Created by Philip Martin on 29/03/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class LastCommentNode: BaseNode {
    var imageNode = ASNetworkImageNode()
    var nameNode = ASTextNode()
    var textNode = ASTextNode()
    
    override init() {
        super.init()
        setupNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hStack = ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [nameNode, textNode])
        hStack.style.flexShrink = 1
        hStack.style.flexGrow = 1
        let layoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [imageNode, hStack])
        
        return ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 10), child: layoutSpec)
        
    }
    
    func populate(feed: NewsFeed?) {
        textNode.attributedText = NSAttributedString(string: feed?.lastComment?.comment ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        nameNode.attributedText = NSAttributedString(string: feed?.lastComment?.user?.username ?? "", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        imageNode.url = URL(string: feed?.lastComment?.user?.profileIcon ?? "")
    }
    
    private func setupNode() {
        imageNode.style.preferredSize = CGSize(width: 20, height: 20)
        imageNode.cornerRadius = 20/2
    }
}
