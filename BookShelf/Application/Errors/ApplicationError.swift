enum ApplicationError : Error {
    case notfount(message: String)
    
    public var description: String {
        switch self {
        case .notfount(let message):
            return message
        }
    }
}
