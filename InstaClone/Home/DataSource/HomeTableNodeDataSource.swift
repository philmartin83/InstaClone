//
//  HomeTableNodeDataSource.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class HomeTableNodeDataSource: NSObject, ASTableDataSource{
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 20
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        if indexPath.section == 0{
            let cell = StoryCellNode()
            return cell
        }else{
            let cell = FeedCellNode()
            cell.popluate(name: "Name \(indexPath.row)")
            return cell
        }
    }
}
