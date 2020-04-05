//
//  HomeTableNodeDataSource.swift
//  InstaClone
//
//  Created by Philip Martin on 13/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class HomeTableNodeDataSource: NSObject, ASTableDataSource{

    var reloadTableView: (() -> Void)?
    private var dataSource: BaseDataSource?
    
    func fetchDataFromLocalPath(){
        dataSource = Bundle.main.decode(BaseDataSource.self, from: localJSONFile)
        if let _ = dataSource{
            reloadTableView?()
        }else{
            fatalError("Couldn't get data from bundle extension")
        }
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return dataSource?.newsFeed?.count ?? 0
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            if indexPath.section == 0{
                // this will only get executed once
                let cell = StoryCellNode(stories: self?.dataSource?.stories, user: self?.dataSource?.myUser)
                return cell
            }else{
                let item = self?.dataSource?.newsFeed?[indexPath.row]
                let cell = FeedCellNode(feed: item)
                return cell
            }
        }
    }
}
