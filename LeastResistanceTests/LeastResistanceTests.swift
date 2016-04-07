import XCTest

class LeastResistanceTests: XCTestCase {
    
    func testAGridCanBeCreated() {
        let expectedGrid: [[Int]] = [[1, 2, 3, 4, 5],
                                     [6, 7, 8, 9, 10]]

        let leastResistance = LeastResistance(grid: expectedGrid)

        XCTAssertEqual(expectedGrid, leastResistance.grid)
        XCTAssertTrue(leastResistance.isValidGrid())
    }

    func testAGridMustHaveAtLeastOneRow() {
        let invalidGrid: [[Int]] = []

        let leastResistance = LeastResistance(grid: invalidGrid)

        XCTAssertFalse(leastResistance.isValidGrid())
    }

    func testAGridCanHaveAMaximumOfTenRows() {
        let invalidGrid: [[Int]] = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11]]

        let leastResistance = LeastResistance(grid: invalidGrid)

        XCTAssertFalse(leastResistance.isValidGrid())
    }
    
}
