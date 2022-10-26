
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool?
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = ""
    }
    
    private var displayNumberValue: Double {
        get {
            if let number = Double(displayLabel.text!) {
                return number
            } else {
                displayLabel.text = "tap some numbers"
                print("Cannot convert display lable text to a Double.")
                return 0.0
            }
        }
        set {
            displayLabel.text = newValue.withCommas()
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayNumberValue)
        if let calcSymbol = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcSymbol) {
                displayNumberValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let newNamValue = sender.currentTitle {
            if isFinishedTypingNumber == true && newNamValue != "."{
                displayLabel.text = newNamValue
                isFinishedTypingNumber = false
            } else {
                if newNamValue == "." && displayLabel.text?.contains(".") == true {
                    return
                } else {
                    displayLabel.text = displayLabel.text! + newNamValue
                }
            }
        }
    }
}

extension Double {
   func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 8  // default is 3 decimals
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
