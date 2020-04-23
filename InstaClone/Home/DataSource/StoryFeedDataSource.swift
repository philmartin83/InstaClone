//
//  StoryFeedDataSource.swift
//  InstaClone
//
//  Created by Philip Martin on 05/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class StoryFeedDataSource: NSObject, ASCollectionDataSource {
    var myUser: User?
    var unwatchedStories: [Stories]?
    var watchedStories: [Stories]?
    
    func setStoriesData(dataSource: [Stories]?, myUser: User?) {
        self.unwatchedStories = dataSource?.filter{d in d.isWatched == false}
        self.watchedStories = dataSource?.filter{d in d.isWatched == true}
        self.myUser = myUser
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 3
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return self.unwatchedStories?.count ?? 0
        } else {
            return self.watchedStories?.count ?? 0
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            if indexPath.section == 0 {
                let cell = UserStorieNode()
                cell.populateUser(user: self?.myUser)
                return cell
            } else if indexPath.section == 1 {
                let story = self?.unwatchedStories?[indexPath.item]
                let cell = StoryFeedNode()
                cell.populate(story: story, isWatched: false)
                return cell
            } else {
                let story = self?.watchedStories?[indexPath.item]
                let cell = StoryFeedNode()
                cell.populate(story: story, isWatched: true)
                return cell
            }
        }
    }
}
