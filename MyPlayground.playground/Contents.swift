

var highScore:Int

var loadedScore:Int? =  1000

if let okScore = loadedScore{
    highScore = okScore
}else{
    highScore = 0
}

highScore = loadedScore != nil ? loadedScore! : 0

highScore = loadedScore ?? 0
