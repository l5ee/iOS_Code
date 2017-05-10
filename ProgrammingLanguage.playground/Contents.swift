//: Playground - noun: a place where people can play

import UIKit

//获取年龄


//得到当前时间
let currentDate = Date()
//定义出生日期
var myBirthday = DateComponents()
myBirthday.year = 1992
myBirthday.month = 09
myBirthday.day = 23
//抓换DateComponents -> Date
let myDate = (Calendar.current.date(from: myBirthday))!
//设定日历类型为公历
let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
//计算年纪
let myAge = gregorian.dateComponents([Calendar.Component.year], from: myDate, to: currentDate)

print(myAge.year)
