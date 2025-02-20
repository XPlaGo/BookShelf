import Foundation
import Swinject

let container = Container()
    .registerInMemoryPersistense()
    .registerServices()
    .registerCli()

let worker = container.resolve(Worker.self)

worker?.run()
