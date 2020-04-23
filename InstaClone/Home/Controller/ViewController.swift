//
//  ViewController.swift
//  InstaClone
//
//  Created by Philip Martin on 08/12/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class ViewController: ASViewController<BaseNode> {
    
    var newsFeed: HomePresentation!
    init() {
        super.init(node: BaseNode())
        self.node.backgroundColor = .white
        newsFeed = HomePresentation()
        self.node.addSubnode(newsFeed)
        node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.newsFeed)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "InstaClone"
    }
    
}

