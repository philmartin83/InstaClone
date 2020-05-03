//
//  ImagePickerViewController.swift
//  InstaClone
//
//  Created by Philip Martin on 27/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ImagePickerViewController: ASViewController<ASDisplayNode> {
    
    init() {
        super.init(node: ASDisplayNode())
        self.node.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

