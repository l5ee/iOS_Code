class DataController {
    static let name = "David"
    var colorArray = ["red","green","blue"]
    class func sayhello() {
        print("Hello Everybody")
    }
    private init() {
        
    }
    static let shared = DataController()
}


DataController.shared.colorArray[0] = "pink"

protocol ApplicationDelegate {
    func finishedLaunching()
}

class Application {
    static let shared = Application()
    private init() {
        
    }
    var delegate: ApplicationDelegate?
}

class AppDelegate:ApplicationDelegate{
    func finishedLaunching() {
        print("finishedLaunching")
    }
}