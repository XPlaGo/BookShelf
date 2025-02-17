public struct PaginationModel {
    public let cursor: Int
    public let limit: Int
    
    init(cursor: Int, limit: Int) {
        self.cursor = cursor
        self.limit = limit
    }
}
