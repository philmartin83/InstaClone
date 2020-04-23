//
//  ProfilePresenter.swift
//  InstaClone
//
//  Created by Philip Martin on 23/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ProfilePresenter: BaseNode, ASCollectionDelegate {
    
    var collectionNode: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        collectionNode.backgroundColor = .clear
        return collectionNode
    }()
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: collectionNode)
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width:width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
    
    
}
