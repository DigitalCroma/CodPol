//
//  PlistParserTests.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 19/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import XCTest
@testable import CodPol

class PlistParserTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetSideMenuListElementsAreGreaterThanZero() {
        // Given
        let sideMenuArray = PlistParser.getSideMenuList()
        
        // When
        
        
        // Then
        XCTAssertNotNil(sideMenuArray, "Side Menu can't be nil")
        XCTAssert((sideMenuArray?.count)! > 0, "Side Menu List must contain several elements")
    }
}
