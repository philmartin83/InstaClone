//
//  DividerNode.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class DividerNode: BaseNode{
    private let dividerNode = ASDisplayNode()
    
    override init() {
        super.init()
        dividerNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
        dividerNode.backgroundColor = .lightGray
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: dividerNode)
    }
}
