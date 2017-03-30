var inputNumber = 2
var isPrime = 1 // 1: is Prime; 2: is not Prime; 0: reenter

if inputNumber <= 0{
    isPrime = 0 // reenter
}else if inputNumber == 1{
    isPrime = 2 // not Prime
}else{
    for i in 2 ..< inputNumber{
        if inputNumber % i == 0{
            //inputNumber is not prime
            isPrime = 1
        }
    }
}

switch isPrime {
case 1:
    print("\(inputNumber) 是质数")
case 2:
    print("\(inputNumber) 不是质数")
default:
    print("请输入大于0的数字")
}


func checkPrime(testNumber:Int) -> String{
    var isPrime = 1 // 1: is Prime; 2: is not Prime; 0: reenter
    if testNumber <= 0{
        isPrime = 0 // reenter
    }else if testNumber == 1{
        isPrime = 2 // not Prime
    }else{
        for i in 2 ..< testNumber{
            if testNumber % i == 0{
                //inputNumber is not prime
                isPrime = 1
            }
        }
    }
    switch isPrime {
    case 1:
        return "\(testNumber)是质数"
    case 2:
        return "\(testNumber)不是质数"
    default:
        return "请输入大于0的数字"
    }

}

checkPrime(testNumber: 11)
