public class DefaultBooksService: BooksService {
    private let repository: BooksRepository

    public init(repository: BooksRepository) {
        self.repository = repository
    }

    func create(model: CreateBookModel) -> Book {
        let book = Book(
            id: BookId.empty(),
            title: model.title,
            author: model.author,
            publicationYear: model.publicationYear,
            genre: model.genre)

        return repository.add(book)
    }

    func remove(_ id: BookId) throws -> Book {
        let result = repository.remove(id)
        
        if result == nil {
            throw ApplicationError.notfount(message: "Cannot find book with id \(id)")
        }
        
        return result!
    }

    func getById(_ id: BookId) throws -> Book {
        let result = repository.getAll(
            filter: GetAllBooksFilterModel(bookIds: [id]),
            pagination: PaginationModel(cursor: 0, limit: 1))

        if result.first == nil {
            throw ApplicationError.notfount(message: "Cannot find book with id \(id)")
        }
        
        return result.first!
    }
    
    func getAll(pagination: PaginationModel) -> [Book] {
        repository.getAll(filter: GetAllBooksFilterModel(), pagination: pagination)
    }
    
    func getAllByGenre(genre: BookGenre, pagination: PaginationModel) -> [Book] {
        repository.getAll(
            filter: GetAllBooksFilterModel(genres: [genre]),
            pagination: pagination)
    }
}
