//
//  StoryHighlightsNode.swift
//  InstaClone
//
//  Created by Philip Martin on 04/05/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class StoryHighlightsNode: BaseCellNode {
    
    var collectionNode: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        collectionNode.backgroundColor = .clear
        collectionNode.alwaysBounceHorizontal = true
        collectionNode.showsHorizontalScrollIndicator = false
        return collectionNode
    }()
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: collectionNode)
    }
    
    // MARK: - Delegate this is a test for 1080 p
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width:width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
}
