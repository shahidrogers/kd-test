// Credits medium.com/@johnsundell
// https://medium.com/@johnsundell/writing-unit-tests-in-swift-playgrounds-9f5b6cdeb5f7

import Foundation
import XCTest


public class TestObserver: NSObject, XCTestObservation {
    @nonobjc public func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
