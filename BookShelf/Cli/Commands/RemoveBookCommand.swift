class RemoveBookCommand: Command {
    private let bookService: BooksService

    init(bookService: BooksService) {
        self.bookService = bookService
    }

    func execute(args: [String]) throws {
        if args.count != 1 {
            throw CliError.invalidArgumentsCount(expected: 1, actual: args.count)
        }

        let id = BookId(args[0])

        let book = try bookService.remove(id)

        print(book)
    }
}
