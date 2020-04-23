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
    
    override init() {
        super.init()
        setupNodes()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 5, justifyContent: .start, alignItems: .center, children: [profileImageSpec])
    }
    
    var profileImageSpec: ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: profileImageNode, corner: addButton, location: .bottomRight)
                // Slightly shift center of badge inside of avatar.
               cornerSpec.offset = CGPoint(x: -20, y: -20)
        return ASInsetLayoutSpec(insets: .init(top: 16, left: 16, bottom: 0, right: 16), child: cornerSpec)
    }
    
    private func setupNodes() {
        
        profileImageNode.style.preferredSize = CGSize(width: 120, height: 120)
        profileImageNode.backgroundColor = .green
        profileImageNode.cornerRadius = 120/2
        
        addButton.backgroundColor = UIColor.colourStringWitHex(hexColour: "00008b", withAlpha: 1)
        addButton.setTitle("+", with: UIFont.boldSystemFont(ofSize: 20), with: .white, for: .normal)
        addButton.borderColor = UIColor.white.cgColor
        addButton.borderWidth = 3
        addButton.style.preferredSize = CGSize(width: 40, height: 40)
        addButton.cornerRadius = 40/2
        
    }
}
