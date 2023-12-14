import SwiftUI
import OneChatLogic

struct ChatStateView: View {
  @StateObject var state: ChatState = .init()
  var body: some View {
    ChatView(messages: state.messages, hasWriteError: state.hasWriteError, postMessage: state.postMessage)
      .onAppear { state.activate() }
      .onDisappear { state.deactivate() }
  }
}

#Preview {
  ChatStateView()
    .frame(width: 340, height: 640)
}
