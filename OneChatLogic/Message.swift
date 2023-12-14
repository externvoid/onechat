import Foundation

public struct Message: Identifiable {
  public let id: ID
  public var user: User
  public var text: String
  public var date: Date

  public init(id: ID = ID(), user: User, text: String, date: Date) {
    self.id = id
    self.user = user
    self.text = text
    self.date = date
  }
//  public init(user: User, text: String, date: Date) {
//    self.init(id: ID(), user: user, text: text, date: date)
//  }
  public struct ID: Hashable {
    public let value: UUID
    public init(_ value: UUID) {
      self.value = value
    }
    public init() {
      self.init(UUID())
    }
  }
}

// Edit at NeoVim
