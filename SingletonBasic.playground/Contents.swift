class DataController{
    //static 变成了类的属性
    static let name = "David"
    var colorArray = ["red", "green", "blue"]
    //class 变成了类别方法
    class func sayhello() {
        print("Hello Everybody!")
    }
    //private 就无法再外面呼叫这个方法了
    private init() {
    }
    //单例模式
    static let shared = DataController()
}

DataController.shared