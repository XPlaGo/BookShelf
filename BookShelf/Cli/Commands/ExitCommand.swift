class ExitCommand: Command {
    func execute(args: [String]) throws {
        throw ExitCodeError(code: 0)
    }
}
