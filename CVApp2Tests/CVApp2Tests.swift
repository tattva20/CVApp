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
        
        QueryAPI.shared.setServiceURL(.summary)
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
        
        QueryAPI.shared.setServiceURL(.skills)
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
        
        QueryAPI.shared.setServiceURL(.workExperience)
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
        
        QueryAPI.shared.setServiceURL(.achievements)
        QueryAPI.shared.fetchData(failure: failClosure, completion: successClosure)
    }
    
    func testSetWithJSONSummaryViewModel() {
        let viewModel = SummaryViewModel()
        
        let error: (Error) -> Void = { error in
             XCTFail()
        }
        
        let completion: (Person) -> Void = { person in
            print(person)
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .summary)
        viewModel.dataFetchError = { error in
             XCTFail()
        }
    }
    
    func testSetWithJSONSkillsViewModel() {
        let viewModel = SkillsViewModel()
        
        let error: (Error) -> Void = { error in
            XCTFail()
        }
        
        let completion: (Skills) -> Void = { person in
            print(person)
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .skills)
        viewModel.dataFetchError = { error in
            XCTFail()
        }
    }
    
    func testSetWithJSONExperienceViewModel() {
        let viewModel = ExperienceViewModel()
        
        let error: (Error) -> Void = { error in
            XCTFail()
        }
        
        let completion: ([Experience]) -> Void = { person in
            print(person)
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .workExperience)
        viewModel.dataFetchError = { error in
            XCTFail()
        }
    }
    
    func testSetWithJSONAchievementsViewModel() {
        let viewModel = AchievementsViewModel()
        
        let error: (Error) -> Void = { error in
            XCTFail()
        }
        
        let completion: (Achievements) -> Void = { person in
            print(person)
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .achievements)
        viewModel.dataFetchError = { error in
            XCTFail()
        }
    }
}
