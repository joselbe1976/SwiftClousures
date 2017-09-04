import Foundation


enum Operations{
    case Add
    case Subtract
    case Div
}

func calculatorOldSkool(opCode: Operations, n1: Int, n2 : Int) -> Int{
    switch opCode {
        case .Add:
            return n1+n2
        case .Subtract:
            return n1-n2
        case .Div:
            return n1/n2

    }
}

calculatorOldSkool(opCode: .Add, n1: 1, n2: 2)


typealias IntegerOperation =  (Int, Int) -> Int

let add : IntegerOperation = { (n1: Int, n2: Int) -> Int in
    return n1 + n2
}

let subtract : IntegerOperation = { (n1: Int, n2: Int) -> Int in
    return n1 - n2
}

add(1,3)
subtract(3,1)


func calculatorCool(operation : IntegerOperation, n1: Int, n2: Int) -> Int{
    return operation(n1, n2)
}


calculatorCool(operation: add, n1: 10,n2: 40)
calculatorCool(operation: subtract, n1: 60,n2: 40)

let newOp : IntegerOperation  = {(n1: Int, n2: Int) -> Int in
    return n1+1 + n2
}

//en ambas le pasamos la clousure
calculatorCool(operation: newOp, n1: 2,n2: 4)
calculatorCool(operation: {(n1: Int, n2: Int) -> Int in
                                return n1+1 + n2
                          }, n1: 2,n2: 4)


