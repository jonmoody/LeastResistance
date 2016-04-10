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

    func testWhenTraversingTheGridThenTheResistanceOfEachColumnIsAddedToTheTotalResistance() {
        let grid: [[Int]] = [[1, 3, 5]]

        let leastResistance = LeastResistance(grid: grid)

        leastResistance.moveToNextColumn(0, currentColumn: 0, totalResistance: 0, path: "")
        XCTAssertEqual(9, leastResistance.getLeastTotalResistance())
    }

    func testWhenTraversingTheGridToTheLastColumnThenTheEnergyFlowHasSuccessfullyTraversedTheGrid() {
        let grid: [[Int]] = [[1, 3, 5]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn(0, currentColumn: 0, totalResistance: 0, path: "")

        XCTAssertEqual("Yes", leastResistance.isFlowSuccessful())
    }

    func testWhenTraversingTheGridIfTheTotalResistanceIsGreaterThan50ThenTheFlowCannotContinue() {
        let grid: [[Int]] = [[1, 50, 5]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn(0, currentColumn: 0, totalResistance: 0, path: "")

        XCTAssertEqual("No", leastResistance.isFlowSuccessful())
    }

    func testWhenTraversingTheGridIfTheTotalResistanceIsGreaterThan50ThenTheFurthestPossiblePathIsSaved() {
        let grid: [[Int]] = [[1, 1, 50, 50],
                             [5, 50, 50, 50]]

        let leastResistance = LeastResistance(grid: grid)

        XCTAssertEqual("1 1", leastResistance.calculateMostEfficientPath())
    }

    func testWhenTraversingTheGridIfTheTotalResistanceIsGreaterThan50ThenTheCurrentResistanceIsExcluded() {
        let grid: [[Int]] = [[1, 1, 50, 50],
                             [5, 50, 50, 50]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.calculateMostEfficientPath()

        XCTAssertEqual(2, leastResistance.getLeastTotalResistance())
    }

    func testWhenTraversingTheGridThenTheRowsNextToTheCurrentRowCanBeTraveled() {
        let grid: [[Int]] = [[1, 2, 1],
                             [3, 1, 3]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn(0, currentColumn: 0, totalResistance: 0, path: "")

        XCTAssertEqual("1 2 1", leastResistance.calculateMostEfficientPath())
    }

    func testWhenTraversingTheGridMovingUpFromTheFirstRowThenTheFlowWrapsToTheLastRow() {
        let grid: [[Int]] = [[1, 2],
                             [2, 5],
                             [3, 1]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn(0, currentColumn: 0, totalResistance: 0, path: "")

        XCTAssertEqual("1 3", leastResistance.calculateMostEfficientPath())
    }

    func testWhenTraversingTheGridMovingDownFromTheLastRowThenTheFlowWrapsToTheFirstRow() {
        let grid: [[Int]] = [[3, 1],
                             [2, 5],
                             [1, 3]]

        let leastResistance = LeastResistance(grid: grid)
        leastResistance.moveToNextColumn(2, currentColumn: 0, totalResistance: 0, path: "")

        XCTAssertEqual("3 1", leastResistance.calculateMostEfficientPath())
    }

    func testWhenTraversingTheGridTheMostEfficientPathCanBeFoundStartingFromTheFirstRow() {
        let grid: [[Int]] = [[3, 4, 1, 2, 8, 6],
                             [6, 1, 8, 2, 7, 4],
                             [5, 9, 3, 9, 9, 5],
                             [8, 4, 1, 3, 2, 6],
                             [3, 7, 2, 8, 6, 4]]

        let leastResistance = LeastResistance(grid: grid)

        XCTAssertEqual("1 2 3 4 4 5", leastResistance.calculateMostEfficientPath())
    }

    func testWhenTraversingTheGridTheMostEfficientPathCanBeFoundInSubsequentRows() {
        let grid: [[Int]] = [[9, 9, 9, 9, 9, 9],
                             [9, 9, 9, 9, 9, 1],
                             [9, 9, 1, 9, 1, 9],
                             [9, 1, 9, 1, 9, 9],
                             [1, 9, 9, 9, 9, 9]]

        let leastResistance = LeastResistance(grid: grid)

        XCTAssertEqual("5 4 3 4 3 2", leastResistance.calculateMostEfficientPath())
    }

    func createGridWithOverOneHundredColumns() -> [[Int]] {
        var grid: [[Int]] = [[]]
        for var x = 0; x < 101; x++ {
            grid[0].append(1)
        }
        return grid
    }
    
}
