//
//  LikedViewController.swift
//  InstaClone
//
//  Created by Philip Martin on 27/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class LikedViewController: ASViewController<BaseNode> {
    init() {
        super.init(node: BaseNode())
        backgroundColour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        backgroundColour()
    }
    
    private func backgroundColour() {
        self.node.backgroundColor = .systemBackground
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Activty"
    }
}
