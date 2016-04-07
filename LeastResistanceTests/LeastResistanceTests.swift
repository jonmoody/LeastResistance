import XCTest

class LeastResistanceTests: XCTestCase {
    
    func testAGridCanBeCreated() {
        let expectedGrid: [[Int]] = [[1, 2, 3, 4, 5],
                                     [6, 7, 8, 9, 10]]

        let leastResistance = LeastResistance(grid: expectedGrid)

        XCTAssertEqual(expectedGrid, leastResistance.grid)
    }
    
}
