import Darwin

class Worker {
    private let provider: Provider

    init(provider: Provider) {
        self.provider = provider
    }

    func run() {
        while true {
            do {
                let exec = try provider.next();
                try exec()
            } catch let applicationError as ApplicationError {
                print("\(applicationError.description)")
            } catch let cliError as CliError {
                print("\(cliError.description)")
            } catch let exitCodeError as ExitCodeError {
                exit(exitCodeError.code)
            } catch let error {
                print("\(error)")
            }
        }
    }
}
