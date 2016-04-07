class LeastResistance {

    let grid: [[Int]]

    init(grid: [[Int]]) {
        self.grid = grid
    }

    func isValidGrid() -> Bool {
        return grid.count > 0
    }
}