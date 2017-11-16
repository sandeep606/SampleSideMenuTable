//
//  ViewController.swift
//  SideMenuSample
//
//  Created by sandeep on 15/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//
import UIKit
class ViewController : UIViewController {

        init() {
        super.init(nibName: nil, bundle: nil)

        title = "Demo Animation App"

        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(showRightView(sender:)))
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }

    // MARK: -

    func showRightView(sender: AnyObject?) {
        sideMenuController?.showRightView(animated: true, completionHandler: nil)

        for case let childController as ProfileViewController in (sideMenuController?.childViewControllers)!{
            
            childController.loadData()
            
        }
    }

}
