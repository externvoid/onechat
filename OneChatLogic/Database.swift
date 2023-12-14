import Dispatch
import Combine
public enum Database {
  // 初期値ありのSubject、現在値あり
  private static let _messagesSubject: CurrentValueSubject<[Message], Error> = .init([])

  public static func messages() -> AnyPublisher<[Message], Error> {
    return _messagesSubject.eraseToAnyPublisher()
  }

  public static func postMessage(_ message: Message, completion: @escaping (Result<Void, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      if Bool.random() {
        _messagesSubject.value.append(message)
        completion(.success(()))
      } else {
        completion(.failure(DummyError()))
      }
    }
  }
}
