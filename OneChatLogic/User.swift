import Foundation

public struct User {
  public let id: ID
  public var name: String

  public init(id: User.ID, name: String) {
    self.id = id
    self.name = name
  }

  public struct ID: Hashable, ExpressibleByStringLiteral {
    public let value: String

    public init(_ value: String) {
      self.value = value
    }
    public init(stringLiteral value: String) {
      self.init(value)
    }
  }
}
