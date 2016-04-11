import UIKit

class LeastResistanceViewController: UIViewController {
    @IBOutlet weak var grid: UITextView!
    @IBOutlet weak var pathOfLeastResistanceLabel: UILabel!
    @IBOutlet weak var flowSuccessfulLabel: UILabel!
    @IBOutlet weak var totalResistanceLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        grid.layer.cornerRadius = 5
        grid.layer.borderColor = UIColor.blackColor().CGColor
        grid.layer.borderWidth = 2

        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderColor = UIColor.blackColor().CGColor
        calculateButton.layer.borderWidth = 2
    }

    @IBAction func calculatePathOfLeastResistance(sender: AnyObject) {
        let gridArray: [[Int]] = transformTextToArray(grid.text)

        let leastResistance = LeastResistance(grid: gridArray)

        pathOfLeastResistanceLabel.text = "Path: " + leastResistance.calculateMostEfficientPath()
        flowSuccessfulLabel.text = "Is Flow Successful: " + leastResistance.isFlowSuccessful()
        totalResistanceLabel.text = "Total Resistance: " + String(leastResistance.getLeastTotalResistance())
    }

    func transformTextToArray(text: String) -> [[Int]] {
        let rows = text.componentsSeparatedByString("\n")
        var gridArray: [[Int]] = [[]]

        for (var row: Int = 0; row < rows.count; row++) {
            var currentRow: [String] = rows[row].componentsSeparatedByString(" ")
            var numbersInRow: [Int] = []
            for (var column = 0; column < currentRow.count; column++) {
                numbersInRow.append(Int(currentRow[column])!)
            }
            gridArray.append(numbersInRow)
        }
        gridArray.removeFirst()

        return gridArray
    }
}

