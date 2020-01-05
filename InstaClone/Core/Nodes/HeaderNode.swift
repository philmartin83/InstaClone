//
//  HeaderNode.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class HeaderNode: BaseNode{
    
    var profileImageNode = ASNetworkImageNode()
    var nameNode = ASTextNode()
    var extraButton = ASButtonNode()
    var elipseNode = ASImageNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8,
                                 left: 16,
                                 bottom: 8,
                                 right: 0),
            child: profileImageNode)
        
        let iconSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [extraButton])
        
        let rightPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0,
                                 left: 0,
                                 bottom: 0,
                                 right: 16),
            child: iconSpec)
        rightPadding.style.flexGrow = 1
        
        let layoutSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10, justifyContent: .start,
            alignItems: .center,
            children:
            [
                leftPadding,
                nameNode,
                rightPadding]
        )
        return layoutSpec
    }
    
    //MARK:- Private Fucntions
    
    private func setup(){
//        profileImageNode.backgroundColor = .green
        profileImageNode.cornerRadius = 35/2
        profileImageNode.style.preferredSize = CGSize(width: 35, height: 35)
        if let colour = iconColour{
            let image = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "elipse")!)
            extraButton.setImage(image, for: .normal)
        }
        extraButton.style.preferredSize = CGSize(width: 10, height: 10)
    }
    
}
