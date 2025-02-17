public struct BookId: Equatable, Hashable {
    let value: String
    
    static func empty() -> BookId {
        return BookId("")
    }
    
    init(_ value: String) {
        self.value = value
    }
}
