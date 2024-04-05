print("Hello, world!")


//ПЕРЕМЕННЫЕ

var myVariable = 42 //переменная
myVariable = 50
var max = UInt32.max
let myConstant = 42 //константа
let explicitDouble: Double //обьвление с указанием типа данных
explicitDouble = 45

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let name = "Pavel"
let hello:String = "Hello, \(name)"

var welcome = "hello"
welcome.insert("!", at: welcome.startIndex)
// welcome теперь равен "hello!"
welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
// welcome теперь равен "hello there!”

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

let tuple = ("red", 5, "Kirill")

var (color, _, name) = tuple

print(String(color) + " " + String(name))


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

func greet(person: [String: String]) {
          guard let name = person["name"] else {
                    return
          }

          print("Привет \(name)!")

          guard let location = person["location"] else {
                    print("Надеюсь у тебя там хорошая погода.")
                    return
          }

          print("Надеюсь в \(location) хорошая погода.")
}

greet(person: ["name": "John"])
// Выведет "Привет John!"
// Выведет "Надеюсь у тебя там хорошая погода."

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

let somePoint = (1, 1)
switch somePoint {
          case (0, 0):
                    print("\(somePoint) is at the origin")
          case (_, 0):
                    print("\(somePoint) is on the x-axis")
          case (0, _):
                    print("\(somePoint) is on the y-axis")
          case (-2...2, -2...2):
                    print("\(somePoint) is inside the box")
          default:
                    print("\(somePoint) is outside of the box")
}
// Выведет "(1, 1) is inside the box"

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

// func greet(_ name: String, on day: String) -> String {
// return "Hello \(name), today is \(day)."
// }
// greet("John", on: "Wednesday")

//func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) 

func makeIncrementer() -> ((Int) -> Int) {
          func addOne(number: Int) -> Int {
                    return 1 + number
          }
          return addOne
}
var increment = makeIncrementer()
increment(7) //makeIncrementer()(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
          for item in list {
                    if condition(item) {
                              return true
                    }
          }
          return false
}

func lessThanTen(number: Int) -> Bool {
          return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//({})

numbers.map({ (number: Int) -> Int in
                    let result = 3 * number
                    return result
})

//если тип очевиден можно пропустить и тип параметра и тип возвращаемый а замыкание неявно возвращает значение единсвтенного выражения если оператор один
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)