struct SizeStruct {
    var width: Float = 5.0
    var height: Float = 8.0
    func area() -> Float {
        return width * height
    }
}


class SizeClass {
    var width: Float = 5.0
    var height: Float = 8.0
    func area() -> Float {
        return width * height
    }
}


var sizeClass1 = SizeClass()
var sizeClass2 = sizeClass1
sizeClass1.width = 100
sizeClass2.width