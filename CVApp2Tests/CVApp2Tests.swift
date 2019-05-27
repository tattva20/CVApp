//
//  CVApp2Tests.swift
//  CVApp2Tests
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import XCTest
@testable import CVApp2

class CVApp2Tests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    // MARK: - QueryAPITests
    
    func testSummaryResponse() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify summary JSON response", comment: ""))
        
        let failClosure: (Error) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Data) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.setServiceURL(service: .summary)
        QueryAPI.shared.fetchData(failure: failClosure, completion: successClosure)
    }
    
    func testSkillsResponse() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify skills JSON response", comment: ""))
        
        let failClosure: (Error) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Data) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.setServiceURL(service: .skills)
        QueryAPI.shared.fetchData(failure: failClosure, completion: successClosure)
    }
    
    func testExperienceResponse() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify experience JSON response", comment: ""))
        
        let failClosure: (Error) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Data) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.setServiceURL(service: .workExperience)
        QueryAPI.shared.fetchData(failure: failClosure, completion: successClosure)
    }
    
    func testAchievementsResponse() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify achievements JSON response", comment: ""))
        
        let failClosure: (Error) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Data) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.setServiceURL(service: .achievements)
        QueryAPI.shared.fetchData(failure: failClosure, completion: successClosure)
    }
}
