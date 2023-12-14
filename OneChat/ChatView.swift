// 2023-12-13 Wn
// 2023-12-14 Th
import OneChatLogic
import SwiftUI

struct ChatView: View {
  let messages: [Message]
  let hasWriteError: Bool
  @State var messageText: String = ""
  let postMessage: (Message, @escaping (Result<Void, Error>) -> Void) -> Void // 1.
  @Namespace var bottomID: Namespace.ID
  var body: some View {
    ScrollViewReader { proxy in
      VStack {
        ScrollView() {
          LazyVStack(alignment: .leading, spacing: 0) {
            ForEach(messages) { message in
              MessageView(message: message)
                .padding()
              Divider()
            }
            Divider()
              .id(bottomID) // Jmp Dst
          }
        }
        Divider()
        VStack(alignment: .leading) {
          if hasWriteError {
            Text("Comm Error")
              .foregroundColor(.red)
              .fontWeight(.bold)
          }
          HStack {
            TextField("", text: $messageText)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
              let message: Message = .init(user: PreviewValues.user, text: messageText, date: Date())
              postMessage(message) { result in // 2. 投稿の結果がresult
                do {
                  try result.get()
                  proxy.scrollTo(bottomID)
                } catch {
                  messageText = message.text
                }
              }
              messageText = ""
              proxy.scrollTo(bottomID)

            } label: {
              Image(systemName: "paperplane")
            }
          }
          .padding()
        }
      }
    }
  }
}

#Preview{
  //  ContentView(messages: messages)
  ChatView(messages: PreviewValues.messages, hasWriteError: true) { _, _ in }
    .frame(width: 340, height: 640)
}
