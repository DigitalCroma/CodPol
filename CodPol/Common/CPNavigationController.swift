//
//  CPNavigationController.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 18/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import UIKit
import SideMenu

class CPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the menus
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: UIStoryboard.init(name: kSideMenuStoryboardName, bundle: nil).instantiateViewController(withIdentifier: kSideMenuViewControllerIdentifier))
        menuLeftNavigationController.leftSide = true
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
        SideMenuManager.menuPushStyle = .replace
        SideMenuManager.menuAllowPushOfSameClassTwice = false
        SideMenuManager.menuAnimationBackgroundColor = UIColor.white
        
        viewControllers = [UIStoryboard.init(name: kCodigoPoliciaStoryboardName, bundle: nil).instantiateViewController(withIdentifier: kCodigoPoliciaViewControllerIdentifier)]
    }
}
