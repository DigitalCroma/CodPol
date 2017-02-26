//
//  DBStoreProtocolTests.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 25/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import XCTest
@testable import CodPol

class DBStoreProtocolTests: XCTestCase {
    var sut: DBStoreProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //CoreDataStore.copyDataBase()
        sut = CoreDataStore.sharedInstance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchPoliceCodeIsNotEmpty() {
        // Given
        var policeCode: PoliceCode!
        let asyncExpectation = expectation(description: "dataFetch")
        
        // When
        sut.fetchPoliceCode { (result, error) in
            XCTAssertNil(error, "The police code couldn't be fetched")
            
            policeCode = result
            asyncExpectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNil(error, "The police code couldn't be fetched")
            XCTAssert(policeCode.books.count > 0, "Fetch police code cannot return an empty array")
        }
    }
    
    func testNumberOfArticlesFetchedIs243() {
        // Given
        var policeCode: PoliceCode!
        var numberOfArticles = 0
        let asyncExpectation = expectation(description: "dataFetch")
        
        // When
        sut.fetchPoliceCode { (result, error) in
            XCTAssertNil(error, "The police code couldn't be fetched")
            
            policeCode = result
            for books in policeCode.books {
                for titles in books.titles {
                    for chapters in titles.chapters {
                        for _ in chapters.articles {
                            numberOfArticles += 1
                        }
                    }
                }
            }
            
            asyncExpectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNil(error, "The police code couldn't be fetched")
            XCTAssert(numberOfArticles == 243, "The number of fetched articles has to be 243")
        }
    }
}
