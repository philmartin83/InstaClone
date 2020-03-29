//
//  HomePresentation.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class HomePresentation: BaseNode, ASTableDelegate{
    let table = ASTableNode()
    let dataSource = HomeTableNodeDataSource()
    
    override init() {
        super.init()
        table.dataSource = dataSource
        table.view.tableFooterView = UIView(frame: .zero)
        dataSource.fetchDataFromLocalPath()
        dataSource.reloadTableView = { [weak self] in
            if let weakSelf = self{
                weakSelf.table.reloadData()
            }
        }
        table.allowsSelection = false
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: table)
    }
    
    //MARK:- Delegate
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
}
