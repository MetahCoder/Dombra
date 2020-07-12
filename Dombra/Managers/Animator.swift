//
//  Animator.swift
//  Dombra
//
//  Created by Metah on 3/1/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK:- Properties
    weak var containerView: UIView!
    weak var toView: UIView!
    
    private let duration = 0.5
    
    // MARK:- Protocol Methods
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        setupViews(context: transitionContext)
        
        containerView.addSubview(toView)
        
        toView.alpha = 0

        UIView.animate(withDuration: duration, animations: {
            self.toView.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
    
    // MARK: Helper Methods
    private func setupViews(context: UIViewControllerContextTransitioning) {
        containerView = context.containerView
        toView = context.viewController(forKey: .to)!.view
    }
}
