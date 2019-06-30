//
//  HeaderView.swift
//  PartyUp
//
//  Created by roli on 29.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var imageView: UIImageView = {
        var iv = UIImageView(image: #imageLiteral(resourceName: "event4.jpg"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSubview(imageView)
        imageView.fillSuperview()
        
        setupVisualEffectBlur()
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0 , curve: .linear,
                                          animations: { [weak self ] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
