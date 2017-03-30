

class Baby{
    var name:String
    var age:Int
    
    func sleep(){
        print("sleep")
    }
    func introduceSelf(){
        print("My name is \(name)")
    }
    init() {
        name = "Tom"
        age = 1
        sleep()
    }
    init(name:String) {
        self.name = name
        age = 1
    }
    init(age:Int) {
        self.age = age
        name = "Sophie"
    }
    init(name:String, age:Int) {
        self.name = name
        self.age = age

    }
}

class CuteBaby:Baby{
    var  nickname:String
    
    
    func danceAndSing(){
        print("dance and sing")
    }
    override func sleep() {
        print("Sleep with cute smile")
    }
    override func introduceSelf() {
        print("My name is \(nickname)")
    }
    override init(){
        nickname = "QQ"
        super.init()
        
    }
}

let iAMSoQ = CuteBaby()
//iAMSoQ.sleep()
iAMSoQ.introduceSelf()







