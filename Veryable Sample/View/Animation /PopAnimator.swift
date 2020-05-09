//
//  PopAnimator.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/9/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    static let singleton = PopAnimator()
    
    let duration = 1.0
    var presenting = true
    var imageOriginFrame = CGRect.zero
    var transitionImage = UIImage()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        //get views
        let homeView = presenting ?
            (transitionContext.viewController(forKey: .from) as! HomeViewController).homeView!
            :
            (transitionContext.viewController(forKey: .to) as! HomeViewController).homeView!
        
        let detailView = presenting ?
            (transitionContext.viewController(forKey: .to) as! AccountDetailViewController).accountDetailView!
            :
            (transitionContext.viewController(forKey: .from)! as! AccountDetailViewController).accountDetailView!
        
        homeView.layoutSubviews()
        detailView.layoutSubviews()
        
        //calculate start/finish frames for image animation
        var detailImageFrame = detailView.superview!.convert(detailView.imageView.frame, to: nil)
        detailImageFrame.origin.y = detailImageFrame.origin.y + 64
        let initialImageFrame = presenting ? imageOriginFrame : detailImageFrame
        let finalImageFrame = presenting ? detailImageFrame : imageOriginFrame
        
        //creat ImageView to animate throughout transition
        let transitionImageView = UIImageView(image: self.transitionImage)
        transitionImageView.frame = initialImageFrame
        
        //calculate start/finish frames for the detailView
        let visibleFrame = containerView.frame
        let initialDetailFrame = presenting ? CGRect(x: visibleFrame.width, y: 0, width: visibleFrame.width, height: visibleFrame.height) : visibleFrame
        let finalDetailFrame = presenting ? visibleFrame : CGRect(x: visibleFrame.width, y: 0, width: visibleFrame.width, height: visibleFrame.height)
        
        detailView.superview?.frame = initialDetailFrame
        detailView.imageView.isHidden = true
    
        containerView.addSubview(homeView.superview!)
        containerView.addSubview(detailView.superview!)
        containerView.bringSubviewToFront(detailView.superview!)
        containerView.addSubview(transitionImageView)
        
        UIView.animate(
            withDuration: duration,
            delay:0.0,
            options: [.curveEaseInOut],
            animations: {
                detailView.superview?.frame.origin.x = self.presenting ? finalDetailFrame.origin.x : initialDetailFrame.origin.x
                transitionImageView.frame = self.presenting ? finalImageFrame : initialImageFrame
        }, completion: { _ in
            //remove placeholder animation image
            transitionImageView.removeFromSuperview()
            //show actual image when done
            detailView.imageView.isHidden = false
            transitionContext.completeTransition(true)
        })
        
    }
    
    
    
}
