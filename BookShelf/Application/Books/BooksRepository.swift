public protocol BooksRepository {
    func add(_ book: Book) -> Book
    
    func remove(_ id: BookId) -> Book?
    
    func getAll(filter: GetAllBooksFilterModel, pagination: PaginationModel) -> [Book]
}
