//
//  CalculationViewControllerTests.swift
//  wallcalcaroniTests
//
//  Created by Asset Ryskul on 01.08.2022.
//  Copyright © 2022 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculatorViewControllerTests: XCTestCase {
    
    var sut: CalculatorViewController!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController
        sut.loadViewIfNeeded()
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAddingValue_ShouldUpdateValue() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "25")
    }
    
    func testEqualButton_ShouldPerformCalculationUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.subtractBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "20")
    }
    
    func testOperandButton_ShouldPerformChanges() {
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.multiplyBtn.sendActions(for: .touchUpInside)
        sut.addBtn.sendActions(for: .touchUpInside)
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "8")
    }
    
    func testClearButton_ShouldClearLabel() {
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.sevenBtn.sendActions(for: .touchUpInside)
        sut.acBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "0")
    }
}
