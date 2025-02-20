class ExitCodeError: Error {
    let code: Int32
    
    init(code: Int32) {
        self.code = code
    }
}
