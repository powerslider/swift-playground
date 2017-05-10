//: Playground - noun: a place where people can play

import UIKit

func evaluate (expression: String) -> Double {
    let expr = NSExpression(format: expression)
    let evaluated = expr.expressionValue(with: nil, context: nil) as! Double
    return evaluated
}
evaluate(expression: "(23 + 6) * 2")

func evaluateFormula(formula: String, values: Dictionary<String, Int>) -> Double {
    var localForm = formula
    
    for (letter, number) in values {
        localForm = localForm.replacingOccurrences(of: letter, with: String(number))
    }
    
    return evaluate(expression: localForm)
}

var vals : [String: Int] = ["a": 1, "b": 2, "c": 3]
evaluateFormula(formula: "(a + b + c) * 2", values: vals)