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
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [headerNode, imageFeedNode, likeCommentNode])
        return vStack
    }
    
    func popluate(name: String){
        headerNode.nameNode.attributedText = NSAttributedString(string: name, attributes: [NSAttributedString.Key.foregroundColor: UIColor.label,  NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        
        // handle the like logic this can be put into its own class
         let number = Int.random(in: 0 ..< 100000)
        likeCommentNode.likeCount = number
        let stringValue = number == 1 ? "\(number) like" : "\(number) likes"
        likeCommentNode.numberOfLikes.attributedText = NSAttributedString(string: stringValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)])
    }
}
