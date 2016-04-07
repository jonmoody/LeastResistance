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

    func testAGridMustHaveAtLeastFiveColumns() {
        let invalidGrid: [[Int]] = [[1, 2, 3, 4]]

        let leastResistance = LeastResistance(grid: invalidGrid)

        XCTAssertFalse(leastResistance.isValidGrid())
    }

    func testAGridCanHaveAMaximumOfOneHundredColumns() {
        let invalidGrid: [[Int]] = createGridWithOverOneHundredColumns()

        let leastResistance = LeastResistance(grid: invalidGrid)

        XCTAssertFalse(leastResistance.isValidGrid())
    }

    func testWhenMovingToTheNextColumnThenTheResistanceOfTheNextColumnIsAddedToTheTotalResistance() {
        let grid: [[Int]] = [[1, 3, 5]]

        let leastResistance = LeastResistance(grid: grid)

        leastResistance.moveToNextColumn()
        XCTAssertEqual(1, leastResistance.getTotalResistance())

        leastResistance.moveToNextColumn()
        XCTAssertEqual(4, leastResistance.getTotalResistance())
    }

    func testWhenMovingToTheLastColumnThenTheEnergyFlowHasSuccessfullyTraversedTheGrid() {
        let grid: [[Int]] = [[1, 3, 5]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn()
        leastResistance.moveToNextColumn()
        leastResistance.moveToNextColumn()

        XCTAssertEqual("Yes", leastResistance.isFlowSuccessful())
    }

    func testWhenMovingToTheNextColumnIfTheTotalResistanceIsGreaterThan50ThenTheFlowCannotContinue() {
        let grid: [[Int]] = [[1, 50, 5]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn()
        leastResistance.moveToNextColumn()

        XCTAssertEqual("No", leastResistance.isFlowSuccessful())
    }

    func testWhenTraversingTheGridThenTheTraveledRowsCanBeRetrieved() {
        let grid: [[Int]] = [[1, 2, 3],
                             [4, 5, 1]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn()
        leastResistance.moveToNextColumn()

        leastResistance.currentRow++
        leastResistance.moveToNextColumn()

        XCTAssertEqual("1 1 2", leastResistance.getPathOfLeastResistance())
    }

    func testWhenTraversingTheGridThenTheRowsNextToTheCurrentRowCanBeTraveled() {
        let grid: [[Int]] = [[4, 2, 6],
                             [1, 5, 3]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn()
        leastResistance.moveToNextColumn(1)
        leastResistance.moveToNextColumn(-1)

        XCTAssertEqual("1 2 1", leastResistance.getPathOfLeastResistance())
    }

    func createGridWithOverOneHundredColumns() -> [[Int]] {
        var grid: [[Int]] = [[]]
        for var x = 0; x < 101; x++ {
            grid[0].append(1)
        }
        return grid
    }
    
}
