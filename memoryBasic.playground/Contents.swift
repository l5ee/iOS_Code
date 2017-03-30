class Person{
    var heart: Heart?
    init() {
        
        print("a person is being initialized")
    }
    deinit {
        print("a person is being deinitialized")
    }
    
}




class Heart{
    var person: Person?
    init() {
        
        print("a heart is being initialized")
    }
    deinit {
        print("a heart is being deinitialized")
    }
    
}

var aPerson:Person? = Person()
var aheart:Heart? = Heart()
//aPerson = nil
