import Foundation

let book1 = Book(
    id: BookId.empty(),
    title: "book title",
    author: "book author",
    publicationYear: nil,
    genre: BookGenre.fiction)
let book2 = Book(
    id: BookId.empty(),
    title: "book title",
    author: "book author",
    publicationYear: nil,
    genre: BookGenre.biography)

let context = InMemoryDatabaseContext()
let repository = InMemonyBooksRepository(context: context)

let addedBook1 = repository.add(book1)
let addedBook2 = repository.add(book2)

let gotBooks = repository.getAll(
    filter: GetAllBooksFilterModel(),
    pagination: PaginationModel(cursor: 0, limit: 10))

print("addedBook: \(addedBook1)")
print("addedBook2: \(addedBook2)")
print("gotBooks: \(gotBooks)")
