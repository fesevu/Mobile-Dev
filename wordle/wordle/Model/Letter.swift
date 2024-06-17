//подсветка буквы
enum LetterHighlight: Hashable {
    case none
    case correct
    case wrongPlace
    case wrong
}

struct Letter: Hashable {
    var title: String = ""
    var highlight: LetterHighlight = .none
}
