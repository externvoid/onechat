import Foundation
import OneChatLogic

// why cannot find Message?
enum PreviewValues {
  static let user: User = User(id: "xyz", name: "tana00")
  static let message: Message = .init(
    user: User(id: "abc", name: "tana00"),
    text: """
      運営党員
      公認議員や政策立案へも関わり、 日本を変える行動を起こしたい方向けコース
      4,000円／月
      """, date: Date()
  )
  static var messages: [Message] = [
    .init(
    user: User(id: "abc", name: "tana00"),
    text: """
      運営党員
      公認議員や政策立案へも関わり、 日本を変える行動を起こしたい方向けコース
      4,000円／月
      """, date: Date()
    ),
    .init(
    user: User(id: "def", name: "hiro00"),
    text: """
      特攻に失敗して生き残った男、何人も特攻へ送り出し、何人もの殉職者を出してしまったと贖罪意識に苛まれている男の物語。
      """, date: Date()
    ),
    .init(
    user: User(id: "ghi", name: "machi00"),
    text: """
      キッチン・ハイター、次亜塩素酸ナトリウムは？
      fenced: 括弧付き、引用符付き、カッコ、引用符付き
      """, date: Date()
    ),
  ]
}
