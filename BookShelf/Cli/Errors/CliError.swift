enum CliError: Error {
    case invalidArgumentsCount(expected: Int, actual: Int)
    case noArgumentsProvided
    case argumentParsingError(argument: String, message: String)
    case commandNotFound(name: String)
    
    public var description: String {
        switch self {
        case .invalidArgumentsCount(expected: let expected, actual: let actual):
            return "Invalid arguments count. Expected: \(expected), Actual: \(actual)"
        case .noArgumentsProvided:
            return "No argument provided"
        case .argumentParsingError(let argument, let message):
            return "Cannot parse argument: \"\(argument)\". \(message)"
        case .commandNotFound(let comand):
            return "Command not found: \(comand)"
        }
    }
}
