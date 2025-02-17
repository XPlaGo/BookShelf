import Foundation

public class Book: CustomStringConvertible {
    let id: BookId
    let title: String
    let author: String
    let publicationYear: Int?
    let genre: BookGenre
    
    init(
        id: BookId,
        title: String,
        author: String,
        publicationYear: Int?,
        genre: BookGenre
    ) {
        self.id = id
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.genre = genre
    }
    
    public var description: String {
        return """
Book {
    id: \(id)
    title: \(title)
    author: \(author)
    publicationYear: \(String(describing: publicationYear))
    genre: \(genre)
}
"""
    }
}
