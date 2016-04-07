class LeastResistance {

    let grid: [[Int]]

    init(grid: [[Int]]) {
        self.grid = grid
    }

    func isValidGrid() -> Bool {
        return grid.count > 0 && grid.count <= 10 && grid[0].count >= 5 && grid[0].count <= 100
    }
}