import OneChatLogic
import SwiftUI

struct MessageView: View {
  let message: Message
  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      Image(systemName: "person.fill")
        .resizable()
        .frame(width: 50, height: 50)
      #if os(OSX)
        .background(Color(NSColor.systemGray))
      #elseif os(iOS)
        .background(Color(UIColor.systemGray))
      #endif
        .clipShape(Circle())
      VStack(alignment: .leading, spacing: 4) {
        Text(message.user.name)
          .font(.headline)
        Text(message.text)
        Text(message.date.description)
          .font(.footnote)
      }
    }
  }
}
#Preview{
  MessageView(message: PreviewValues.message)
//    .frame(width: 340, height: 460)
}
