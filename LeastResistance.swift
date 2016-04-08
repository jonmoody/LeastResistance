class LeastResistance {

    let grid: [[Int]]
    var currentRow: Int = 0
    var currentColumn: Int = -1
    var totalResistance: Int = 0
    var pathOfLeastResistance: String = ""

    init(grid: [[Int]]) {
        self.grid = grid
    }

    func isValidGrid() -> Bool {
        return gridContainsValidNumberOfRows() && gridContainsValidNumberOfColumns()
    }

    func gridContainsValidNumberOfRows() -> Bool {
        return grid.count > 0 && grid.count <= 10
    }

    func gridContainsValidNumberOfColumns() -> Bool {
        return grid[0].count >= 5 && grid[0].count <= 100
    }

    func moveToNextColumn(moveToNewRow: Int) {
        if (currentRow == 0) {
            currentRow = grid.count - 1
        } else {
            currentRow += moveToNewRow
        }
        moveToNextColumn()
    }

    func moveToNextColumn() {
        currentColumn++
        totalResistance += grid[currentRow][currentColumn]

        if (!pathOfLeastResistance.isEmpty) {
            pathOfLeastResistance += " "
        }
        pathOfLeastResistance += String(currentRow + 1)
    }

    func getTotalResistance() -> Int {
        return totalResistance
    }

    func isFlowSuccessful() -> String {
        return totalResistance <= 50 ? "Yes" : "No"
    }

    func getPathOfLeastResistance() -> String {
        return pathOfLeastResistance
    }
}