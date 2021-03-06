//
//  ProfileSectionsNode.swift
//  InstaClone
//
//  Created by Philip Martin on 23/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ProfileSectionsNode: BaseCellNode {
    
    private var profileImageNode = ProfileHeaderAndStatsNode()
    private var profileBioNode = ProfileBioNode()
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .start, children: [profileImageNode, profileBioNode])
    }
    
}

