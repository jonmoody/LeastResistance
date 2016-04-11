class LeastResistance {

    let grid: [[Int]]

    let maxTotalResistance: Int = 50

    let minNumberOfRows: Int = 1
    let maxNumberOfRows: Int = 10
    let minNumberOfColumns: Int = 5
    let maxNumberOfColumns: Int = 100

    var leastTotalResistance: Int = 99
    var pathOfLeastResistance: String = ""

    var bestPossibleResistance: Int = 99
    var bestPossiblePath: String = ""

    var furthestColumn: Int = -1
    var flowSuccessful: Bool = false

    init(grid: [[Int]]) {
        self.grid = grid
    }

    func isValidGrid() -> Bool {
        return gridContainsValidNumberOfRows() && gridContainsValidNumberOfColumns() && columnCountsMatch()
    }

    func gridContainsValidNumberOfRows() -> Bool {
        return grid.count >= minNumberOfRows && grid.count <= maxNumberOfRows
    }

    func gridContainsValidNumberOfColumns() -> Bool {
        return grid[0].count >= minNumberOfColumns && grid[0].count <= maxNumberOfColumns
    }

    func columnCountsMatch() -> Bool {
        let columnCount: Int = grid[0].count
        for (var row: Int = 1; row < grid.count; row++) {
            if (grid[row].count != columnCount) {
                return false
            }
        }
        return true
    }

    func calculateMostEfficientPath() -> String {
        for (var row: Int = 0; row < grid.count; row++) {
            moveToNextColumn(row, currentColumn: 0, totalResistance: 0, path: "")
        }

        if (!flowSuccessful) {
            leastTotalResistance = bestPossibleResistance
            return bestPossiblePath
        }

        return pathOfLeastResistance
    }

    func moveToNextColumn(var currentRow: Int, currentColumn: Int, var totalResistance: Int, var path: String) {
        currentRow = wrapCurrentRow(currentRow)

        let currentResistance = grid[currentRow][currentColumn]
        totalResistance += currentResistance

        if (totalResistance > maxTotalResistance) {
            if (currentColumn > furthestColumn || currentColumn == furthestColumn && bestPossibleResistance > totalResistance - currentResistance) {
                bestPossibleResistance = totalResistance - currentResistance
                bestPossiblePath = path
                furthestColumn = currentColumn
            }
            return
        }

        path = addCurrentRowToPath(path, currentRow: currentRow)

        moveToAdjacentNodes(currentRow, currentColumn: currentColumn, totalResistance: totalResistance, path: path)
    }

    func getLeastTotalResistance() -> Int {
        return leastTotalResistance
    }

    func isFlowSuccessful() -> String {
        return flowSuccessful ? "Yes" : "No"
    }

    func addCurrentRowToPath(var path: String, currentRow: Int) -> String {
        if (!path.isEmpty) {
            path += " "
        }

        path += String(currentRow + 1)

        return path
    }

    func wrapCurrentRow(var currentRow: Int) -> Int {
        if (currentRow < 0) {
            currentRow = grid.count - 1
        } else if (currentRow == grid.count) {
            currentRow = 0
        }
        return currentRow
    }

    func moveToAdjacentNodes(currentRow: Int, currentColumn: Int, totalResistance: Int, path: String) {
        if (currentColumn == grid[0].count - 1) {
            if (totalResistance < leastTotalResistance) {
                leastTotalResistance = totalResistance
                pathOfLeastResistance = path
                furthestColumn = currentColumn
                flowSuccessful = true
            }
        } else {
            moveToNextColumn(currentRow - 1, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
            moveToNextColumn(currentRow, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
            moveToNextColumn(currentRow + 1, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
        }
    }
}