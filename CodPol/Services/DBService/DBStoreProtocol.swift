//
//  DBStoreProtocol.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 24/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import Foundation

protocol DBStoreProtocol {
    func fetchPoliceCode(completionHandler: (PoliceCode, Error?) -> Void)
}
