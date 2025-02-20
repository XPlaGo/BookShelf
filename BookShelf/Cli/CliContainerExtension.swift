import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCli() -> Self {
        self.register(Provider.self) { r in CliProvider(resolver: r) }
        self.autoregister(Worker.self, initializer: Worker.init)

        self.autoregister(CreateBookCommand.self, initializer: CreateBookCommand.init)
        self.autoregister(RemoveBookCommand.self, initializer: RemoveBookCommand.init)
        self.autoregister(ExitCommand.self, initializer: ExitCommand.init)
        self.autoregister(GetAllBooksCommand.self, initializer: GetAllBooksCommand.init)
        self.autoregister(GetAllBooksByGenreCommand.self, initializer: GetAllBooksByGenreCommand.init)

        return self
    }
}
