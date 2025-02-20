protocol Provider {
    func next() throws -> (() throws -> Void)
}
