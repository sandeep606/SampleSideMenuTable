//
//  ProfileViewController+Animations.swift
//  SideMenuSample
//
//  Created by sandeep on 16/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//

import Foundation
import UIKit
extension ProfileViewController{
    
    func animateHeader(){
        
        UIView.animate(withDuration: 0.15, delay: 0.1, options: [.transitionFlipFromRight], animations: {
            self.horizontalSpacing?.constant = 20.0
            self.lblUsername.alpha = 1.0
            self.profileProgressBar.alpha = 1.0
            self.lblSpaceUsage.alpha = 1.0
            self.view.layoutIfNeeded()
        }) { (isCompleted) in
            self.tableProfileMenu.reloadData()
            self.insertRowsToTable(rowIndex: 0, rowSection: 0) // starting insertion from ZERO'th indexPath.
            self.perform(#selector(self.animateImage), with: nil, afterDelay: 0.5) // performing animation after a delay of few msecs.
        }
    }
    
    @objc func animateImage() -> Void {
        
        heightConstraint?.isActive = true
        let animationDuration = 0.15
        let newHeight:CGFloat = 70.0
        UIView.animate(withDuration: animationDuration, animations: {
            self.heightConstraint?.constant = newHeight*widthMultiplier
            self.imageViewAvatar.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.view.layoutIfNeeded()
        }) { (isCompleted) in
            self.animateAgain()
        }
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = 0.0
        animation.toValue = (newHeight/2)*widthMultiplier
        animation.duration = animationDuration
        self.imageViewAvatar.layer.add(animation, forKey: "cornerRadius")
        self.imageViewAvatar.layer.cornerRadius = (newHeight/2)*widthMultiplier
    }
    
    
    func animateAgain(){
        
        UIView.animate(withDuration: 0.15, animations: {
            
            self.horizontalSpacing?.constant -= 10
            self.imageViewAvatar.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.view.layoutIfNeeded()
        }, completion: { (isCompleted) in

            self.lastHopp()
        })
        
    }
    
    func lastHopp(){
        UIView.animate(withDuration: 0.1, animations: {
            
            self.imageViewAvatar.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.horizontalSpacing?.constant += 10
            self.view.layoutIfNeeded()
            
        }) { (completed) in
            
        }
    }
    
}
