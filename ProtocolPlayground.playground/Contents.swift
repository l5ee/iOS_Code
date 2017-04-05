
protocol MoneyTransferProtocol{
    func giveMoney()
}

class RichPeople: MoneyTransferProtocol{
    
    func giveMoney() {
        print("Give you 100 dollars")
    }
}


class NormalPeople: MoneyTransferProtocol{
    
    func giveMoney() {
        print("Give you 10 dollars")
    }
}



class PooGuy{
    var helper:MoneyTransferProtocol?
    func needMoney(){
        helper?.giveMoney()
    }
}

let aPoorGuy = PooGuy()
let aRichPeople = RichPeople()
let aNormalPeople = NormalPeople()

aPoorGuy.helper = aNormalPeople

aPoorGuy.needMoney()


protocol Workable{
    func work()
}

class Worker: Workable{
    func work() {
        print("Working from 9 to 5")
    }
}

class Boss{
    var delegate: Workable?
    func makeMoney(){
        delegate?.work()
    }
}

let aBoss = Boss()
let aWorker = Worker()

aBoss.delegate = aWorker

aBoss.makeMoney()


































