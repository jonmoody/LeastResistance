import XCTest
@testable import LeastResistanceUI

class LeastResistanceViewControllerTests: XCTestCase {
    
    func testWhenThePathOfLeastResistanceIsCalculatedThenTheTextIsTransformedIntoAGrid() {
        let text: String = "1 2 3\n4 5 6"

        let viewController = LeastResistanceViewController()
        let gridArray: [[Int]] = viewController.transformTextToArray(text)

        XCTAssertEqual(gridArray, [[1, 2, 3], [4, 5, 6]])
    }
    
}
