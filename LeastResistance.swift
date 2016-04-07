class LeastResistance {

    let grid: [[Int]]
    var currentColumn: Int = -1
    var totalResistance: Int = 0

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

    func moveToNextColumn() {
        currentColumn++
        totalResistance += grid[0][currentColumn]
    }

    func getTotalResistance() -> Int {
        return totalResistance
    }

    func isFlowSuccessful() -> String {
        return totalResistance <= 50 ? "Yes" : "No"
    }
}