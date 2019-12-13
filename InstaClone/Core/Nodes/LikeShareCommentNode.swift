//
//  LikeShareCommentNode.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class LikeShareCommentNode: BaseNode{
    var likeButton = ASButtonNode()
    var commentButton = ASButtonNode()
    var shareButton = ASButtonNode()
    var numberOfLikes = ASTextNode()
    var bookmark = ASButtonNode()
    var likeShareComment = LikeShareCommentInteractor()
    
    var likeCount: Int?
    
    override init(){
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hStackSingle = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [bookmark])
        
        let singleStack = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0,
                                 left: 0,
                                 bottom: 0,
                                 right: 8), child: hStackSingle)
        singleStack.style.flexGrow = 1
        
        let hStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .stretch,
            children: [likeButton, commentButton, shareButton, singleStack])
        let padding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(
                top: 8,
                left: 16,
                bottom: 8,
                right: 0),
            child: hStack)
        
        var dynamicLayout = [ASLayoutElement]()
        dynamicLayout.append(padding)
        let dynamicPadding = ASInsetLayoutSpec()
        if let count = likeCount, count > 0{
            dynamicPadding.insets = UIEdgeInsets(
                                top: 0,
                                left: 16,
                                bottom: 8,
                                right: 0)
            dynamicPadding.child = numberOfLikes
            dynamicLayout.append(dynamicPadding)
            
        }
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: dynamicLayout)
        return vStack
    }
    
    private func setup(){
        likeButton.style.preferredSize = CGSize(width: 30, height: 30)
        commentButton.style.preferredSize = CGSize(width: 30, height: 30)
        shareButton.style.preferredSize = CGSize(width: 30, height: 30)
        
        if let colour = iconColour{
            let imageLike = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "like")!)
            likeButton.setImage(imageLike, for: .normal)
            likeButton.addTarget(likeShareComment, action: #selector(likeShareComment.postLike), forControlEvents: .touchUpInside)
            
            let imageComment = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "comment")!)
            commentButton.setImage(imageComment, for: .normal)
            
            let imageShare = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "share")!)
            shareButton.setImage(imageShare, for: .normal)
            
            let imageBookmark = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "bookmark")!)
            bookmark.setImage(imageBookmark, for: .normal)
            
        }
    }
}
