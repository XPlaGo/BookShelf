import Foundation
import Swinject

class CliProvider: Provider {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func next() throws -> () throws -> Void {
        print("> ", terminator: "")

        let line = readLine()!
        let args = line.split(separator: " ")
            .map(String.init)
            .filter { !$0.isEmpty }

        if args.isEmpty {
            throw CliError.noArgumentsProvided
        }

        let commandName = args.first!
        let remainingArgs = Array(args.dropFirst())

        let command = self.matchCommand(commandName: commandName)

        if (command == nil) {
            throw CliError.commandNotFound(name: commandName)
        }

        return {
            try command!.execute(args: remainingArgs)
        }
    }

    private func matchCommand(commandName: String) -> Command? {
        switch commandName {
            case "create-book":
                return resolver.resolve(CreateBookCommand.self)
            case "remove-book":
                return resolver.resolve(RemoveBookCommand.self)
            case "books":
                    return resolver.resolve(GetAllBooksCommand.self)
            case "books-by-genre":
                    return resolver.resolve(GetAllBooksByGenreCommand.self)
            case "exit":
                return resolver.resolve(ExitCommand.self)
            default:
                return nil
        }
    }
}
