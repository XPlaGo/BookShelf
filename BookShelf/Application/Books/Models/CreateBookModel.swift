class CreateBookModel {
    let title: String
    let author: String
    let publicationYear: Int?
    let genre: BookGenre
    
    init(title: String, author: String, publicationYear: Int?, genre: BookGenre) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.genre = genre
    }
}
