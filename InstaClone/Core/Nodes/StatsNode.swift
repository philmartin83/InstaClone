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
    private var followerCount = ASTextNode()
    private var followingCount = ASTextNode()
    
    override init() {
        super.init()
    }
    
    //    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    //        return ASStackLayoutSpec(direction: .vertical, spacing: 15, justifyContent: .start, alignItems: .stretch, children: [profileImageNode])
    //    }
    
}
