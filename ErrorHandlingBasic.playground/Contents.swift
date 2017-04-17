enum NameInputError:Error {
    case empty
    case isNumber
}




func getUserFullnam(fistname:String, lastname:String) throws -> String {
    if fistname == "" || lastname == "" {
        throw NameInputError.empty
    }else if Int(fistname) != nil || Int(lastname) != nil {
        throw NameInputError.isNumber
    }
    
    let fullname = fistname + "" + lastname
    return fullname
}

do {
    try getUserFullnam(fistname: "111", lastname: "Wei")
}catch NameInputError.empty{
    print("empty name")
}catch NameInputError.isNumber {
    print("input some number")
}catch {
    print("somethin wrong")
}
