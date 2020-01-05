//
//  FeedCellNode.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode{
    var headerNode = HeaderNode()
    var imageFeedNode = FeedImageNode()
    var likeCommentNode = LikeShareCommentNode()
    private var feed: NewsFeed?
    
    init(feed: NewsFeed?) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.feed = feed
        styling()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutArray = [ASLayoutElement]()
        layoutArray.append(headerNode)
        layoutArray.append(imageFeedNode)
        if let likes = feed?.likes, likes > 0{
            layoutArray.append(likeCommentNode)
        }
    
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: layoutArray)
        return vStack
    }
    
    func styling(){
        headerNode.nameNode.attributedText = NSAttributedString(string: feed?.user?.username ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label,  NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        headerNode.profileImageNode.url = URL(string: feed?.user?.profileIcon ?? "")
        // handle the like logic this can be put into its own class
        print("\(feed?.user?.profileIcon)")
        let stringValue = feed?.likes == 1 ? "\(feed?.likes ?? 0) like" : "\(feed?.likes ?? 0) likes"
        likeCommentNode.likeCount = feed?.likes ?? 0
        likeCommentNode.numberOfLikes.attributedText = NSAttributedString(string: stringValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)])
    }
}
