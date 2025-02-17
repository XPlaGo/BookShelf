extension Book {
    public func with(
        id: BookId? = nil,
        title: String? = nil,
        author: String? = nil,
        publicationYear: Int? = nil,
        genre: BookGenre? = nil
    ) -> Book {
        return Book(
            id: id ?? self.id,
            title: title ?? self.title,
            author: author ?? self.author,
            publicationYear: publicationYear ?? self.publicationYear,
            genre: genre ?? self.genre
        )
    }
}
