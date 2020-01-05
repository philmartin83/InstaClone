//
//  User.swift
//  InstaClone
//
//  Created by Philip Martin on 05/01/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import Foundation

struct User: Codable{
    let userId: Int?
    let username: String?
    let profileIcon: String?
    
    enum CodingKeys: String, CodingKey{
        case username
        case userId = "user_id"
        case profileIcon = "profile_image_url"
    }
}
