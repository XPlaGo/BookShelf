import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() -> Self {
        self.autoregister(BooksService.self, initializer: DefaultBooksService.init)

        return self
    }
}
