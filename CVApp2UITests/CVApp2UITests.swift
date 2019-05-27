//
//  CVApp2UITests.swift
//  CVApp2UITests
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import XCTest

// MARK: - CVApp2UITests class

class CVApp2UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    // MARK: - Tests methods
    func testMinimumSectionsSummary() {
        
        let app = XCUIApplication()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Professional Summary"]/*[[".cells.staticTexts[\"Professional Summary\"]",".staticTexts[\"Professional Summary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Name"].exists)
        XCTAssertTrue(app.staticTexts["Last Name"].exists)
        XCTAssertTrue(app.staticTexts["Email"].exists)
        XCTAssertTrue(app.staticTexts["Phone"].exists)
        XCTAssertTrue(app.staticTexts["Degree"].exists)
        XCTAssertTrue(app.staticTexts["Summary"].exists)
    }
    
    func testMinimumSectionsSkills() {
        
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Topics of Knowledge"].tap()
        XCTAssertTrue(app.staticTexts["Skills"].exists)
    }
    
    func testMinimumSectionsExperience() {
        
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Past Experience"].tap()
        XCTAssertTrue(app.staticTexts["Company"].exists)
        XCTAssertTrue(app.staticTexts["Position"].exists)
        XCTAssertTrue(app.staticTexts["Website"].exists)
        XCTAssertTrue(app.staticTexts["StartDate"].exists)
        XCTAssertTrue(app.staticTexts["EndDate"].exists)
        XCTAssertTrue(app.staticTexts["Summary"].exists)
        XCTAssertTrue(app.staticTexts["Highlights"].exists)
    }
    
    func testMinimumSectionsAchievements() {
        
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Achievements"].tap()
        XCTAssertTrue(app.staticTexts["Achievements"].exists)
    }
    
    func testMinimumCellsCountSummary() {
        let app = XCUIApplication()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Professional Summary"]/*[[".cells.staticTexts[\"Professional Summary\"]",".staticTexts[\"Professional Summary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let numberOfCells = app.tables.cells.count
        XCTAssertGreaterThanOrEqual(numberOfCells, 1)
    }
    
    func testMinimumCellsCountSkills() {
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Topics of Knowledge"].tap()
        let numberOfCells = app.tables.cells.count
        XCTAssertGreaterThanOrEqual(numberOfCells, 1)
    }
    
    func testMinimumCellsCountExperience() {
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Past Experience"].tap()
        let numberOfCells = app.tables.cells.count
        XCTAssertGreaterThanOrEqual(numberOfCells, 7)
    }
    
    func testMinimumCellsCountAchievements() {
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["Achievements"].tap()
        let numberOfCells = app.tables.cells.count
        XCTAssertGreaterThanOrEqual(numberOfCells, 1)
    }
}
