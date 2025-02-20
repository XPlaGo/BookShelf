public struct GetAllBooksFilterModel {
    public let bookIds: Set<BookId>
    public let titleSubstring: String?
    public let authorSubstring: String?
    public let publicationYears: Set<Int?>
    public let genres: Set<BookGenre>

    init(
        bookIds: Set<BookId> = [],
        titleSubstring: String? = nil,
        authorSubstring: String? = nil,
        publicationYears: Set<Int> = [],
        genres: Set<BookGenre> = []
    ) {
        self.bookIds = bookIds
        self.titleSubstring = titleSubstring
        self.authorSubstring = authorSubstring
        self.publicationYears = publicationYears
        self.genres = genres
    }
}
