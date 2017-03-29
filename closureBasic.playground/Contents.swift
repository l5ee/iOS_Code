var numberArray = [1,3,5,7,9,2,4,6,8,10]
numberArray.count
//numberArray.append(27)

//let numberArrayAddTen = numberArray.map{$0+10}
//
//numberArrayAddTen
//
//let numberArrayToString = numberArray.map{"This is number \($0)"}
//
//numberArrayToString

let evenNumber = numberArray.filter{ $0 % 2 == 0 }

evenNumber

let biggerFive = numberArray.filter{$0 > 5}

biggerFive