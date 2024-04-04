print("Hello, world!")


//ПЕРЕМЕННЫЕ

var myVariable = 42 //переменная
myVariable = 50
let myConstant = 42 //константа
let explicitDouble: Double //обьвление с указанием типа данных
explicitDouble = 45

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let name = "Pavel"
let hello:String = "Hello, \(name)"

let name = "Многострочные литералы строк"

//Отступы каждой отдельной строчкистроки должны совпадать с отступом закрывающей тройки двойных кавычек.
let quotation = """
Этот литерал записан
в несколько строк.
Это возможно с использованием 3 "
"""

print(quotation)

var shoppingList = ["fish", "milk", "cookie", "cucumber",]
print(shoppingList)
shoppingList[1] = "tea"
print(shoppingList)

var occupations = [
"Malcolm": "Captain",
"Kaylee": "Mechanic",
]
print(occupations)
occupations["Jayne"] = "Public Relations"
print(occupations)

shoppingList.append("blue paint")
print(shoppingList)

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupations = [:]


//циклы и условия
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
          if score > 50 {
                    teamScore += 3
          } else {
                    teamScore += 1
          }
}
print(teamScore)

//ошибка
//if teamScore

//опицональные значения
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
          greeting = "Hello, \(name)"
}
print(greeting)

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
          case "celery":
                    print("Add some raisins and make ants on a log.")
          case "cucumber", "watercress":
                    print("That would make a good tea sandwich.")
          case let x where x.hasSuffix("pepper"):
                    print("Is it a spicy \(x)?")
                    fallthrough
          default:
                    print("Everything tastes good in soup.")
}

let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11, 13],
"Fibonacci": [1, 1, 2, 3, 5, 8],
"Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
          for number in numbers {
                    if number > largest {
                              largest = number
                    }
          }
}
print(largest)

var n = 2
while n < 100 {
          n *= 2
}
print(n)
var m = 2
repeat {
          m *= 2
} while m < 100
print(m)

var firstForLoop = 0
for i in 0..<4 { //... включает последнее значение
          firstForLoop += i
}
print(firstForLoop)


//ФУНКЦИИ И ЗАМЫКАНИЯ
func greet(name: String, day: String) -> String {
          return "Hello \(name), today is \(day)."
}
greet(name: "Bob", day: "Tuesday")