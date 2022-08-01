//
//  wallcalcaroniTests.swift
//  wallcalcaroniTests
//
//  Created by Asset Ryskul on 29.07.2022.
//  Copyright © 2022 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculationManagerTests: XCTestCase {
    
    var sut: CalculationManager!
    
    override func setUp() {
        super.setUp()
        sut = CalculationManager()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit_WhenGivenValues_TakesValues() {
        let calcManagerA = CalculationManager(
            valueA: 10,
            valueB: 20,
            currentOperand: .multiply,
            valueEntryArray: [])
        let calcManagerB = CalculationManager(
            valueA: 10,
            valueB: 20,
            currentOperand: .multiply,
            valueEntryArray: [])
        XCTAssertEqual(calcManagerA, calcManagerB)
    }
    
    func testValues_AreInitiallyZero() {
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
    }
    
    func testValues_InsertValues_ChangingValues() {
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
        sut.insert(value: 20)
        XCTAssertEqual(sut.valueB, 20)
    }
    
    func testOperand_IsInitiallyNil() {
        XCTAssertNil(sut.currentOperand)
    }
    
    func testOperand_WhenOperandSet() {
        sut.set(operand: .add)
        XCTAssertNotNil(sut.currentOperand)
    }
    
    func testCalculation_ForValues() {
        sut.insert(value: 10)
        sut.set(operand: .multiply)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 50)
    }
    
    func testClear_Values() {
        sut.insert(value: 10)
        sut.insert(value: 5)
        _ = sut.clearValues()
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
        XCTAssertEqual(sut.valueEntryArray, [])
        
    }


}
