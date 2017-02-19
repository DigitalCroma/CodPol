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
    
    class func getSideMenuList() -> [String]? {
        var sideMenuArray = [String]()
        if let sideMenuListInfo = loadInfoPlist(forName: kSideMenuListName) {
            for info in sideMenuListInfo {
                guard let name = info["text"]
                    else {
                        continue
                }
                
                sideMenuArray.append(name)
            }
            
            return sideMenuArray
        }
        
        return nil
    }
}
