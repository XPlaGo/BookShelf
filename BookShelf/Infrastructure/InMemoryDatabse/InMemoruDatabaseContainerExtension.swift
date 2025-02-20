import Swinject
import SwinjectAutoregistration

extension Container {
    func registerInMemoryPersistense() -> Self {
        self.register(InMemoryDatabaseContext.self) { _ in InMemoryDatabaseContext() }
            .inObjectScope(.container)

        self.autoregister(BooksRepository.self, initializer: InMemonyBooksRepository.init)

        return self
    }
}
