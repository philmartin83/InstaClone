//
//  BaseNode.swift
//  InstaClone
//
//  Created by Philip Martin on 08/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit


class BaseNode: ASDisplayNode{
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
}

