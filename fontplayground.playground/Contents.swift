//: Playground - noun: a place where people can play

import UIKit

class Book {
    var name: String
    var pages: Int
    init(name: String, pages: Int) {
        self.name = name
        self.pages = pages
    }
}
class Person {
    var name: String
    var book: Book
    init(name: String, book: Book) {
        self.name = name
        self.book = book
    }
}
let 围城 = Book(name: "围城", pages: 888)
let 小明 = Person(name: "小明", book: 围城) // 小明有一本全新的《围城》
//let 小刚 = Person(name: "小刚", book: 围城) // 小刚也有一本全新的《围城》

let 小刚 = 小明
小明.book.pages = 88 // 小明淘气把书弄坏了，只剩88页了
//print(小刚.book.pages) // 输出结果：88  WTF! Where is my new book?


var a1 = 20
let a2 = a1
a1 = 30
print(a2)