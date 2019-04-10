//
//  TailLoadingCellNode.swift
//  TextureTasting
//
//  Created by DonghoChoi on 10/04/2019.
//  Copyright © 2019 killi8n. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TailLoadingCellNode: ASCellNode {
    let spinner: SpinnerNode = SpinnerNode()
    let text = ASTextNode()
    
    override init() {
        super.init()
        addSubnode(text)
        text.attributedText = NSAttributedString(string: "Loading...", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.kern: -0.3
            ])
        addSubnode(spinner)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 16,
            justifyContent: .center,
            alignItems: .center,
            children: [text, spinner])
    }
}


final class SpinnerNode: ASDisplayNode {
    var activityIndicatorView: UIActivityIndicatorView {
        return view as! UIActivityIndicatorView
    }
    
    override init() {
        super.init()
        setViewBlock {
            UIActivityIndicatorView(style: .gray)
        }
        
        self.style.preferredSize = CGSize(width: 20.0, height: 20.0)
    }
    
    override func didLoad() {
        super.didLoad()
        activityIndicatorView.startAnimating()
    }
}
