import Foundation

public class InMemonyBooksRepository: BooksRepository {
    private let context: InMemoryDatabaseContext

    init(context: InMemoryDatabaseContext) {
        self.context = context
    }

    public func add(_ book: Book) -> Book {
        let bookToAdd = book.with(id: BookId(UUID().uuidString))

        self.context.books.append(bookToAdd)

        return bookToAdd
    }

    public func remove(_ id: BookId) -> Book? {
        if let index = self.context.books.firstIndex(where: { $0.id == id }) {
            let bookToRemove = self.context.books[index]

            self.context.books.remove(at: index)

            return bookToRemove
        }

        return nil
    }

    public func getAll(filter: GetAllBooksFilterModel, pagination: PaginationModel) -> [Book] {
        return Array(
            self.context.books
                .filter { self.getAllPredicate(book: $0, filter: filter) }
                .map { $0.with() }
                .dropFirst(pagination.cursor)
                .prefix(pagination.limit))
    }

    private func getAllPredicate(book: Book, filter: GetAllBooksFilterModel) -> Bool {
        return (filter.bookIds.isEmpty || filter.bookIds.contains(book.id))
        && (filter.titleSubstring == nil || book.title.contains(filter.titleSubstring!))
        && (filter.authorSubstring == nil || book.author.contains(filter.authorSubstring!))
        && (filter.publicationYears.isEmpty || filter.publicationYears.contains(book.publicationYear))
        && (filter.genres.isEmpty || filter.genres.contains(book.genre));
    }
}
