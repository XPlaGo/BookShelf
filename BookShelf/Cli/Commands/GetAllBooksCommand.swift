class GetAllBooksCommand: Command {
    private let bookService: BooksService

    init(bookService: BooksService) {
        self.bookService = bookService
    }

    func execute(args: [String]) throws {
        if args.count != 2 {
            throw CliError.invalidArgumentsCount(expected: 2, actual: args.count)
        }

        let pagination = PaginationModel(
            cursor: Int(args[0])!,
            limit: Int(args[1])!)

        let book = bookService.getAll(pagination: pagination)

        print(book)
    }
}
