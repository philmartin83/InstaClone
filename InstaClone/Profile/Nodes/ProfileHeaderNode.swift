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
        return ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .center, children: [profileImageSpec, statsSpec])
    }
    
    var statsSpec: ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .end, alignItems: .end, children: [stats])
             let rightPadding = ASInsetLayoutSpec( insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50),
                                                   child: stack)
             rightPadding.style.flexGrow = 1
        return rightPadding
    }
    
    var profileImageSpec: ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: profileImageNode, corner: addButton, location: .bottomRight)
        // Slightly shift center of badge inside of avatar.
        cornerSpec.offset = CGPoint(x: -12, y: -12)
        let inset =  ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 26), child: cornerSpec)
        let ratioSpec = ASRatioLayoutSpec(ratio: 0.5, child: inset)
        return ratioSpec
    }
    
    override func asyncTraitCollectionDidChange() {
        super.asyncTraitCollectionDidChange()
        dynamicColours()
    }
    
    private func setupNodes() {
        
        profileImageNode.style.preferredSize = CGSize(width: 85, height: 85)
        profileImageNode.image = UIImage(named: "profile")
        profileImageNode.cornerRoundingType = .precomposited
        profileImageNode.cornerRadius = 85/2
        
        addButton.backgroundColor = UIColor.colourStringWitHex(hexColour: "00008b", withAlpha: 1)
        addButton.setTitle("+", with: UIFont.systemFont(ofSize: 17), with: .white, for: .normal)
        dynamicColours()
        addButton.borderWidth = 1.5
        addButton.style.preferredSize = CGSize(width: 27, height: 27)
        addButton.cornerRadius = 25/2
    }
    
    private func dynamicColours() {
        addButton.borderColor = UIColor.tertiarySystemBackground.cgColor
    }
}
