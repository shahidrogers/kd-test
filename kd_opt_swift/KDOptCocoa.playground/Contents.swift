//: KDOptCocoa
// Includes Spry and XCTest
// Modified by Shahid Rogers

import UIKit
import XCTest

let testObserver = TestObserver()
XCTestObservationCenter.shared().addTestObserver(testObserver)

class EntryTest: XCTestCase {
    func testConstructor() {
        let entry = Entry(credits: 1)
        XCTAssertEqual(entry.credits, 1)
    }
}

class CreditManagerTest: XCTestCase {
    let manager = CreditManager()

    func testConstructor() {
        XCTAssertEqual(manager.balance, 0)
    }

    func testAddChangesBalance() {
        let entry = Entry(credits: 5)
        let _  = manager.add(entry: entry)
        XCTAssertEqual(manager.balance, 5)
    }

    func testAddReturnsTuple() {
        let entry = Entry(credits: 5)
        XCTAssertTrue(manager.add(entry: entry) == (true, 5))
    }
    
    func testDeductChangesBalance() {
        manager.balance = 11
        let entry = Entry(credits: 5)
        let _  = manager.deduct(entry: entry)
        XCTAssertEqual(manager.balance, 6)
    }
    
    func testDeductReturnsTuple() {
        manager.balance = 11
        let entry = Entry(credits: 5)
        XCTAssertTrue(manager.deduct(entry: entry) == (true, 6))
    }

    func testDeductReturnsFalseAndCurrentBalanceForNegativeBalance(){
        manager.balance = 5
        let entry = Entry(credits: 6)
        XCTAssertTrue(manager.deduct(entry: entry) == (false, 5))
    }
    
}


class CreditManagerWithOperateTest: XCTestCase {
    let manager = CreditManager()
    
    func testConstructor() {
        XCTAssertEqual(manager.balance, 0)
    }
    
    // NOTE: test cases duplicated, but all add/deduct has been changed to operate
    
    func testAddChangesBalance() {
        let entry = Entry(credits: 5)
        let _  = manager.operate(entry: entry)
        XCTAssertEqual(manager.balance, 5)
    }
    
    func testAddReturnsTuple() {
        let entry = Entry(credits: 5)
        XCTAssertTrue(manager.operate(entry: entry) == (true, 5))
    }
    
    // NOTE: since .deduct has been changed to .operate
    //       credit entries used to deduct from balance
    //       has been changed to negative integers
    
    func testDeductChangesBalance() {
        manager.balance = 11
        let entry = Entry(credits: -5)
        let _  = manager.operate(entry: entry)
        XCTAssertEqual(manager.balance, 6)
    }
    
    func testDeductReturnsTuple() {
        manager.balance = 11
        let entry = Entry(credits: -5)
        XCTAssertTrue(manager.operate(entry: entry) == (true, 6))
    }
    
    func testDeductReturnsFalseAndCurrentBalanceForNegativeBalance(){
        manager.balance = 5
        let entry = Entry(credits: -6)
        XCTAssertTrue(manager.operate(entry: entry) == (false, 5))
    }
    
}


class Entry {
    let description: String
    let credits: Int
    
    init(credits: Int, description: String = "") {
        self.credits = credits
        self.description = description
    }
}

class CreditManager {
    var balance: Int
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func operate(entry: Entry) -> (result: Bool, balance: Int) {
        //create temporary balance
        var newBal = self.balance
        
        //  logic here is that if int is a negative number, operation is deduct
        //  eg; newBal = newBal + (-100) is still equiv to newBal = newBal - 100
        //  which is a deduction operation
        
        //add to temp balance
        newBal += entry.credits
        
        //if temp balance is positive or zero
        if(newBal >= 0){
            //apply temp balance into account balance
            self.balance = newBal
            
            return (true, self.balance)
        }else{
            //failed, so don't change account balance
            return (false, self.balance)
        }
    }
    
    func add(entry: Entry) -> (result: Bool, balance: Int) {
        //create temporary balance
        var newBal = self.balance
        
        //add to temp balance
        newBal += entry.credits
        
        //if temp balance is positive or zero
        if(newBal >= 0){
            //apply temp balance into account balance
            self.balance = newBal
            
            return (true, self.balance)
        }else{
            //failed, so don't change account balance
            return (false, self.balance)
        }
        
    }
    
    func deduct(entry: Entry) -> (result: Bool, balance: Int ){
        //create temporary balance
        var newBal = self.balance
        
        //deduct from temp balance
        newBal -= entry.credits
        
        //if temp balance is positive or zero
        if(newBal >= 0){
            //apply temp balance into account balance
            self.balance = newBal
            
            return (true, self.balance)
        }else{
            //failed, so don't change account balance
            return (false, self.balance)
        }
    }
}
EntryTest.defaultTestSuite().run()
CreditManagerTest.defaultTestSuite().run()
CreditManagerWithOperateTest.defaultTestSuite().run()
