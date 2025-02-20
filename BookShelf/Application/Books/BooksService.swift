protocol BooksService {
    func create(model: CreateBookModel) -> Book

    func remove(_ id: BookId) throws -> Book

    func getById(_ id: BookId) throws -> Book
    
    func getAll(pagination: PaginationModel) -> [Book]
    
    func getAllByGenre(genre: BookGenre, pagination: PaginationModel) -> [Book]
}
