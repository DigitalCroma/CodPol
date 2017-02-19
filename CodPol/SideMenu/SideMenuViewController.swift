//
//  SideMenuViewController.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 18/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import UIKit
import SideMenu

let kSideMenuCellIdentifier = "Cell"

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    let menuOptions = ["Nuevo Código de Policía",
                       "Favoritos",
                       "Mitos y Verdades",
                       "Tipos de Multas",
                       "Acerca de"]
    var selectedIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: kSideMenuCellIdentifier)
        selectedIndexPath = IndexPath(row: 0, section: 0)
        menuTableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .top)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SideMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSideMenuCellIdentifier)
        cell?.textLabel?.text = menuOptions[indexPath.row]
        return cell!
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        switch indexPath.row {
        case 0:
            let viewController = UIStoryboard.init(name: kMainBundleName, bundle: nil).instantiateViewController(withIdentifier: kCodigoPoliciaViewControllerIdentifier)
            navigationController?.pushViewController(viewController, animated: true)
            break
        default:
            let viewController = UIStoryboard.init(name: kMainBundleName, bundle: nil).instantiateViewController(withIdentifier: kFavoritosViewControllerIdentifier)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
