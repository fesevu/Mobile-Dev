struct Model {
          //список слов
          private static var wordsList: [String] = ["книга", "шторы", "мышка", "номер", "ветер"]
          //статус игры: 0 означает игра закончена и все попытки исчерпаны, 1 - игра продолжается, 2 - слово угаданно
          private static var _gameStatus: Int?
          static var gameStatus: Int? {
                              return _gameStatus
          }
          //набор букв которые использованы и не присутсвуют в слове
          private static var usedLetters: [Character]?
          //количетсво оставшихся попыток
          private static var attemptsNumber: Int?
          //отгадываемое слово
          private static var word: String?
          //слово разбитое на символы
          private static var wordArray: [Character]?
          
          //конфигурация начале игры
          static func gameBegin() {
                    word = wordsList.randomElement()
                    if let word {wordArray = Array(word)}
                    attemptsNumber = 5
                    _gameStatus = 1
          }

          //попытка угадать слово
          static func attempt(playerWord:String) -> [Int]{
                    //массив указывающий тип букв(угадал и букву и место(2), угадал букву(1), не угадал(0))
                    let guessArray = isRight(playerWord: playerWord)
                    
                    //если слово отгаданно (на всех буквах статус 2), то игрок выиграл
                    if (!guessArray.contains(0) && !guessArray.contains(1)) {
                              _gameStatus = 2
                    }

                    //последняя попытка и слово не угадано
                    if (!guessArray.contains(2) && attemptsNumber == 1) {
                              _gameStatus = 0
                    }

                    attemptsNumber? -= 1

                    return guessArray
          }
          
          //сверяем по буквам слово введённое игроком и загадонное слово
          private static func isRight(playerWord:String) -> [Int] {
                    // Преобразуем слово игрока в массив символов
                    let playerWordArray = Array(playerWord)

                    //массив указывающий тип букв(угадал и букву и место(2), угадал букву(1), не угадал(0))
                    var guessArray = Array(repeating: 0, count: playerWordArray.count)

                    for (j, playerChar) in playerWordArray.enumerated(){
                              for (i, char) in wordArray!.enumerated() {
                                        if playerChar == char && j == i{
                                                  guessArray[j] = 2
                                                  continue
                                        } else if playerChar == char && j != i {
                                                  guessArray[j] = 1
                                        }
                              } 
                    }

                    return guessArray
          }
}