class CreateBookCommand: Command {
    private let bookService: BooksService

    init(bookService: BooksService) {
        self.bookService = bookService
    }

    func execute(args: [String]) throws {
        if args.count != 4 {
            throw CliError.invalidArgumentsCount(expected: 4, actual: args.count)
        }

        let model = CreateBookModel(
            title: args[0],
            author: args[1],
            publicationYear: Int(args[2]),
            genre: try mapBookGenge(genre: args[3]))

        let book = bookService.create(model: model)

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
