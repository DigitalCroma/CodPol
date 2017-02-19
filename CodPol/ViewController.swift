//
//  ViewController.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 15/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.red
        /*SideMenuManager.menuLeftNavigationController = navigationController as? UISideMenuNavigationController
        SideMenuManager.menuAddPanGestureToPresent(toView: (navigationController?.navigationBar)!)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
        SideMenuManager.menuPushStyle = .replace
        SideMenuManager.menuAllowPushOfSameClassTwice = false*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

