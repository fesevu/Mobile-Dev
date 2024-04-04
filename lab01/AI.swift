import Foundation

// Определение структуры модели
struct NeuralNetwork {
    var weight: Double
    
    mutating func train(input: Double, target: Double, learningRate: Double) {
        // Предсказание значения
        let prediction = input * weight
        
        // Вычисление ошибки
        let error = prediction - target
        
        // Обновление веса с использованием градиентного спуска
        weight -= learningRate * error * input
    }
    
    func predict(input: Double) -> Double {
        return input * weight
    }
}

// Создание модели
var model = NeuralNetwork(weight: 1)

// Обучение модели на нескольких примерах
for _ in 1...1000 {
    let input = Double.random(in: 0...10)
    let target = input * 42
    
    model.train(input: input, target: target, learningRate: 0.01)
}

// Пример использования обученной модели
let input = 5.5
let predictedValue = model.predict(input: input)
print("Предсказанное значение для \(input): \(predictedValue)")
