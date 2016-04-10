class LeastResistance {

    let grid: [[Int]]
    var leastTotalResistance: Int = 99
    var pathOfLeastResistance: String = ""
    var furthestColumn: Int = -1

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

    func moveToNextColumn(var currentRow: Int, currentColumn: Int, var totalResistance: Int, var path: String) {
        if (currentRow < 0) {
            currentRow = grid.count - 1
        } else if (currentRow == grid.count) {
            currentRow = 0
        }

        let currentResistance = grid[currentRow][currentColumn]

        totalResistance += currentResistance

        if (totalResistance > 50) {
            if (currentColumn > furthestColumn) {
                leastTotalResistance = totalResistance - currentResistance
                pathOfLeastResistance = path
                furthestColumn = currentColumn
            }
            return
        }

        path = addCurrentRowToPath(path, currentRow: currentRow)

        if (currentColumn == grid[0].count - 1) {
            if (totalResistance < leastTotalResistance) {
                leastTotalResistance = totalResistance
                pathOfLeastResistance = path
                furthestColumn = currentColumn
            }
        } else {
            moveToNextColumn(currentRow - 1, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
            moveToNextColumn(currentRow, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
            moveToNextColumn(currentRow + 1, currentColumn: currentColumn + 1, totalResistance: totalResistance, path: path)
        }
    }

    func getLeastTotalResistance() -> Int {
        return leastTotalResistance
    }

    func isFlowSuccessful() -> String {
        return leastTotalResistance <= 50 && furthestColumn == grid[0].count - 1 ? "Yes" : "No"
    }

    func addCurrentRowToPath(var path: String, currentRow: Int) -> String {
        if (!path.isEmpty) {
            path += " "
        }

        path += String(currentRow + 1)

        return path
    }

    func calculateMostEfficientPath() -> String {
        for (var row: Int = 0; row < grid.count; row++) {
            moveToNextColumn(row, currentColumn: 0, totalResistance: 0, path: "")
        }

        return pathOfLeastResistance
    }
}