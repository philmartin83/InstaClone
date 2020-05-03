//
//  SearchViewController.swift
//  InstaClone
//
//  Created by Philip Martin on 27/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class SearchViewController: ASViewController<BaseNode> {
    
    init() {
        super.init(node: BaseNode())
        backgroundColour()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        backgroundColour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColour() {
        self.node.backgroundColor = .systemBackground
    }
}
