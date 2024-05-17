class SomeClass {
 // здесь пишется определение класса
}
struct SomeStructure {
 // здесь пишется определение структуры
}

//пример

struct Resolution {
          var width = 0
          var height = 0
}
class VideoMode {
          var resolution = Resolution()
          var interlaced = false
          var frameRate = 0.0
          var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
// Выведет "The width of someResolution is 0"

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Выведет "The width of someVideoMode is 0"

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Выведет "The width of someVideoMode is now 1280"

//тип значений
//классы не получили по элементного инициализатора
let vga = Resolution(width: 640, height: 480)
let vga = Resolution
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Выведет "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Выведет "hd is still 1920 pixels wide"

//ссылочный тип
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Выведет "The frameRate property of tenEighty is now 30.0"

if tenEighty === alsoTenEighty {
          print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Выведет "tenEighty and alsoTenEighty refer to the same VideoMode instance."

struct TimesTable {
          let multiplier: Int
          subscript(index: Int) -> Int {
                    return multiplier * index
          }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("шесть умножить на три будет \(threeTimesTable[6])")
// Выведет "шесть умножить на три будет 18"

struct MyStruct {
    var values: [Int] = []
    
    subscript(index: Int) -> Int {
        get {
            return values[index]
        }
        set { // Здесь мы используем неявный параметр newValue
            values[index] = newValue
        }
    }
}

struct Matrix {
          let rows: Int, columns: Int
          var grid: [Double]
          init(rows: Int, columns: Int) {
                    self.rows = rows
                    self.columns = columns
                    grid = Array(repeating: 0.0, count: rows * columns)
          }

          func indexIsValid(row: Int, column: Int) -> Bool {
                    return row >= 0 && row < rows && column >= 0 && column < columns 
          } 
          
          subscript(row: Int, column: Int) -> Double {
                    get {
                              assert(indexIsValid(row: row, column: column), "Index out of range")
                              return grid[(row * columns) + column]
                    }
                    set {
                              assert(indexIsValid(row: row, column: column), "Index out of range")
                              grid[(row * columns) + column] = newValue
                    }
          }
}

//сабскрипт типа
enum Planet: Int {
          case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
          static subscript(n: Int) -> Planet {
                    return Planet(rawValue: n)!
          }
}
let mars = Planet[4]
print(mars)

struct Celsius {
          var temperatureInCelsius: Double
          init(fromFahrenheit fahrenheit: Double) {
                    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
          }
          init(fromKelvin kelvin: Double) {
                    temperatureInCelsius = kelvin - 273.15
          }
          init(_ celsius: Double) {
                    temperatureInCelsius = celsius
          }
}
let bodyTemperature = Celsius(37.0)
// bodyTemperature.temperatureInCelsius is 37.0

class SurveyQuestion {
          var text: String
          var response: String? //опциональный тип
          init(text: String) {
                    self.text = text
          }
          func ask() {
                    print(text)
          }         
}

let cheeseQuestion = SurveyQuestion(text: "Нравится ли вам сыр?")
cheeseQuestion.ask()
// Выведет "Нравится ли вам сыр?"
cheeseQuestion.response = "Да, я люблю сыр"


struct Size {
          var width = 0.0, height = 0.0
}

struct Point {
          var x = 0.0, y = 0.0
}

struct Rect {
          var origin = Point()
          var size = Size()
          init() {}
          init(origin: Point, size: Size) {
                    self.origin = origin
                    self.size = size
          }
          init(center: Point, size: Size) {
                    let originX = center.x - (size.width / 2)
                    let originY = center.y - (size.height / 2)
                    self.init(origin: Point(x: originX, y: originY), size: size)
          }
}

//родительский класс, суперкласс
class Vehicle {
          var currentSpeed = 0.0
          var description: String = "транспорт"
          func makeNoise() {
                    //ничего не делаем, так как не каждый транспорт шумит
          }
}
//подкласс
class Bicycle: Vehicle {
          var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0

class Train: Vehicle {
          override func makeNoise() {
                    print("Чу-чу")
          }
}

let train = Train()
train.makeNoise()
// Выведет "Чу-чу"

//деинициализаторы
class Bank {
          static var coinsInBank = 10_000
          static func distribute(coins numberOfCoinsRequested: Int) -> Int {
                    let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
                    coinsInBank -= numberOfCoinsToVend
                    return numberOfCoinsToVend
          }
          static func receive(coins: Int) {
                    coinsInBank += coins
          }
}

class Player {
          var coinsInPurse: Int
          init(coins: Int) {
                    coinsInPurse = Bank.distribute(coins: coins)
          }
          func win(coins: Int) {
                    coinsInPurse += Bank.distribute(coins: coins)
          }
          deinit {
                    Bank.receive(coins: coinsInPurse)
          }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Выведет "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Выведет "There are now 9900 coins left in the bank"

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// Выведет "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// Выведет "The bank now only has 7900 coins left"

playerOne = nil
print("PlayerOne has left the game")
// Выведет "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")
// Выведет "The bank now has 10000 coins"