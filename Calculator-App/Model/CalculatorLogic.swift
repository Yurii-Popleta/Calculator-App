
import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (numb1: Double, calcMethod: String)?
    
    mutating func setNumber(_ numberFromLabel: Double) {
        self.number = numberFromLabel
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return  performeTwoNumCalculation(numb2: n)
            default:
                intermediateCalculation = (numb1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performeTwoNumCalculation(numb2: Double) -> Double? {
        
        if let numb1 = intermediateCalculation?.numb1, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return numb1 + numb2
            case "×":
                return Double(numb1 * numb2)
            case "÷":
                return Double(numb1 / numb2)
            case "-":
                return Double(numb1 - numb2)
            default:
                fatalError("The operation passed in dose not match any of the cases")
            }
        }
        return nil
    }
}


