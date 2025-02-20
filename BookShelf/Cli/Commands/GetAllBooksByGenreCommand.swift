class GetAllBooksByGenreCommand: Command {
    private let bookService: BooksService

    init(bookService: BooksService) {
        self.bookService = bookService
    }

    func execute(args: [String]) throws {
        if args.count != 3 {
            throw CliError.invalidArgumentsCount(expected: 3, actual: args.count)
        }

        let genre = try mapBookGenge(genre: args[0])
        let pagination = PaginationModel(
            cursor: Int(args[1])!,
            limit: Int(args[2])!)

        let book = bookService.getAllByGenre(genre: genre, pagination: pagination)

        print(book)
    }

    private func mapBookGenge(genre: String) throws -> BookGenre {
        switch genre {
        case "fiction": return .fiction
        case "nonFiction": return .nonFiction
        case "mystery": return .mystery
        case "sciFi": return .sciFi
        case "biography": return .biography
        default:
            throw CliError.argumentParsingError(
                argument: genre,
                message: "Invalid book genre value")
        }
    }
}
