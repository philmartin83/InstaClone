//
//  StatsNode.swift
//  InstaClone
//
//  Created by Philip Martin on 23/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class StatsNode: BaseCellNode {
    
    private var postCount = ASTextNode()
    private var postStaticStats = ASTextNode()
    private var followerCount = ASTextNode()
    private var followerStaticStats = ASTextNode()
    private var followingCount = ASTextNode()
    private var followingStaticStats = ASTextNode()
    
    override init() {
        super.init()
        populate()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 15, justifyContent: .end, alignItems: .end, children: [postsVSpec, followersVSpec, followingVSpec])
        stack.style.flexShrink = 1
        stack.style.flexGrow = 1
        return stack
    }
    
    var postsVSpec: ASLayoutSpec {
        let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .center, children: [postCount, postStaticStats])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 16), child: vStack)
    }
    
    var followersVSpec: ASLayoutSpec {
        let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .center, children: [followerCount, followerStaticStats])
        
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 10), child: vStack)
    }
    
    var followingVSpec: ASLayoutSpec {
        let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .center, children: [followingCount, followingStaticStats])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 0), child: vStack)
    }
    
    func populate() {
        postCount.attributedText = NSAttributedString(string: "104", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)])
        postStaticStats.attributedText = NSAttributedString(string: "Posts", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)])
        followerCount.attributedText = NSAttributedString(string: "51", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)])
        followerStaticStats.attributedText = NSAttributedString(string: "Followers", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        followingCount.attributedText = NSAttributedString(string: "22", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)])
        followingStaticStats.attributedText = NSAttributedString(string: "Following", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
    }
    
}
