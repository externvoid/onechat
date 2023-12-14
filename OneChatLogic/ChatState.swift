// 2023-12-13 Wn
import Combine
import Dispatch

public class ChatState: ObservableObject {
  @Published public var messages: [Message] = []
  @Published public var hasWriteError: Bool = false
  private var isActive: Bool = false
  private var cancellables: Set<AnyCancellable> = []
  public init() {}
  public func activate() {
    if isActive { return }
    isActive = true
    Database.messages().sink { _ in
      // todo
    } receiveValue: { [weak self] messages in
      guard let self = self else { return }
      self.messages = messages
    }
    .store(in: &cancellables)

  }
  public func deactivate() {
    guard isActive else { return }
    cancellables.removeAll()
  }
  public func postMessage(_ message: Message, completion: @escaping (Result<Void, Error>) -> Void) {
    Database.postMessage(message) { [weak self] result in
      guard let self = self else { return }
      do {
        try result.get()
        self.hasWriteError = false
      } catch {
        self.hasWriteError = true
      }
      completion(result)
    }
  }
}

struct DummyError: Error {}
