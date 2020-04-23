//
//  PorfileHeaderNode.swift
//  InstaClone
//
//  Created by Philip Martin on 23/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ProfileHeaderAndStatsNode: BaseNode {
    
    private var addButton = ASButtonNode()
    private var profileImageNode = ASNetworkImageNode()
    private var stats = StatsNode()
    
    override init() {
        super.init()
        setupNodes()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .end, alignItems: .end, children: [stats])
        let rightPadding = ASInsetLayoutSpec( insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50),
                                              child: stack)
        rightPadding.style.flexGrow = 1
        return ASStackLayoutSpec(direction: .horizontal, spacing: 40, justifyContent: .start, alignItems: .center, children: [profileImageSpec, rightPadding])
    }
    
    var profileImageSpec: ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: profileImageNode, corner: addButton, location: .bottomRight)
        // Slightly shift center of badge inside of avatar.
        cornerSpec.offset = CGPoint(x: -12, y: -12)
        let inset =  ASInsetLayoutSpec(insets: .init(top: 10, left: 5, bottom: 0, right: 26), child: cornerSpec)
        return inset
    }
    
    private func setupNodes() {
        
        profileImageNode.style.preferredSize = CGSize(width: 85, height: 85)
        profileImageNode.backgroundColor = .green
        profileImageNode.cornerRadius = 85/2
        
        addButton.backgroundColor = UIColor.colourStringWitHex(hexColour: "00008b", withAlpha: 1)
        addButton.setTitle("+", with: UIFont.boldSystemFont(ofSize: 15), with: .white, for: .normal)
        addButton.borderColor = UIColor.white.cgColor
        addButton.borderWidth = 3
        addButton.style.preferredSize = CGSize(width: 25, height: 25)
        addButton.cornerRadius = 25/2
        
    }
}
