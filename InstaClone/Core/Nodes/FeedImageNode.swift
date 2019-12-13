//
//  FeedImageNode.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode{
    
    var imageNode = ASImageNode()
    
    override init() {
        super.init()
        
        imageNode.style.preferredSize.width = UIScreen.main.bounds.width
        imageNode.style.preferredSize.height = UIScreen.main.bounds.width / 2
        imageNode.backgroundColor = .purple
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let standardSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: imageNode)
        return standardSpec
    }
}
