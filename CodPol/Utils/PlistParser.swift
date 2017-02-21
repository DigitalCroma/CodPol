//
//  PlistParser.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 19/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import UIKit

let kSideMenuListName = "SideMenuList"

class PlistParser {
    
    class private func loadInfoPlist(forName: String) -> [[String : String]]? {
        if let fileUrl = Bundle.main.url(forResource: forName, withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: String]] {
                return result
            }
        }
        
        return nil
    }
    
    class func getSideMenuList() -> [SideMenuModel]? {
        var sideMenuArray = [SideMenuModel]()
        if let sideMenuListInfo = loadInfoPlist(forName: kSideMenuListName) {
            for info in sideMenuListInfo {
                guard
                    let text = info["text"],
                    let identifier = getIdentifier(forName: info["identifier"]!),
                    let location = getLocation(forName: info["location"]!)
                    else {
                        continue
                }
                
                sideMenuArray.append(SideMenuModel(text: text, identifier: identifier, location: location))
            }
            
            return sideMenuArray
        }
        
        return nil
    }
    
    class private func getIdentifier(forName: String) -> String? {
        switch forName {
        case "kCodigoPoliciaViewControllerIdentifier":
            return kCodigoPoliciaViewControllerIdentifier
        case "kFavoritosViewControllerIdentifier":
            return kFavoritosViewControllerIdentifier
        case "kMitosYVerdadesViewControllerIdentifier":
            return kMitosYVerdadesViewControllerIdentifier
        case "kTiposMultaViewControllerIdentifier":
            return kTiposMultaViewControllerIdentifier
        case "kAcercaDeViewControllerIdentifier":
            return kAcercaDeViewControllerIdentifier
        default:
            return nil
        }
    }
    
    class private func getLocation(forName: String) -> String? {
        switch forName {
        case "kCodigoPoliciaStoryboardName":
            return kCodigoPoliciaStoryboardName
        case "kMitosYVerdadesStoryboardName":
            return kMitosYVerdadesStoryboardName
        case "kFavoritosStoryboardName":
            return kFavoritosStoryboardName
        case "kTiposMultaStoryboardName":
            return kTiposMultaStoryboardName
        case "kAcercaDeStoryboardName":
            return kAcercaDeStoryboardName
        default:
            return nil
        }
    }
}
