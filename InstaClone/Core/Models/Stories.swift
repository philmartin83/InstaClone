//
//  Stories.swift
//  InstaClone
//
//  Created by Philip Martin on 05/01/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import Foundation

struct Stories: Codable{
    let user: User
    let isWatched: Bool
    
    enum CodingKeys: String, CodingKey{
        case user
        case isWatched = "is_watched"
    }
}
