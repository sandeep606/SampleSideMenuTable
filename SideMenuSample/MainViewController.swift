//
//  MainViewController.swift
//  SideMenuSample
//
//  Created by sandeep on 15/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//

import LGSideMenuController

class MainViewController: LGSideMenuController {

    
    func setup() {

        leftViewController = nil//LeftViewController()
        rightViewController = ProfileViewController()

        rightViewWidth = sideMenuVisibilityWidth;
        rightViewBackgroundImage = UIImage(named: "imageRight") // no image right now.
//        rightViewBackgroundColor = UIColor(red: 0.65, green: 0.5, blue: 0.65, alpha: 0.95)
        rightViewBackgroundColor = .darkGray
        rootViewCoverColorForRightView = UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 0.05)
        rightViewPresentationStyle = .scaleFromBig

    }

    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)

        if !isLeftViewStatusBarHidden {
            leftView?.frame = CGRect(x: 0.0, y: 20.0, width: size.width, height: size.height - 20.0)
        }
    }
    
    override func rightViewWillLayoutSubviews(with size: CGSize) {
        super.rightViewWillLayoutSubviews(with: size)
        
        if (!isRightViewStatusBarHidden ||
            (rightViewAlwaysVisibleOptions.contains(.onPadLandscape) &&
                UI_USER_INTERFACE_IDIOM() == .pad &&
                UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation))) {
            rightView?.frame = CGRect(x: 0.0, y: 20.0, width: size.width, height: size.height - 20.0)
        }
    }

    override var isLeftViewStatusBarHidden: Bool {
        get {
            return super.isLeftViewStatusBarHidden
        }
        set {
            super.isLeftViewStatusBarHidden = newValue
        }
    }

    override var isRightViewStatusBarHidden: Bool {
        get {
            return super.isRightViewStatusBarHidden
        }
        set {
            super.isRightViewStatusBarHidden = newValue
        }
    }

    deinit {
        print("MainViewController deinitialized")
    }

}
