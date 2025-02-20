import SwiftUI

struct ContentView: View {
    @State private var showingHistory = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {
                showingHistory = true
            }) {
                Text("View NFC Read History")
            }
            .padding()
            .sheet(isPresented: $showingHistory) {
                NFCReadHistoryView()
            }
        }
        .padding()
    }
}

struct NFCReadHistoryView: View {
    var body: some View {
        List(NFCReadHistory.retrieveAll()) { history in
            VStack(alignment: .leading) {
                Text("Serial Number: \(history.serialNumber)")
                Text("Type: \(history.type)")
                Text("Tech: \(history.tech)")
                Text("Payload: \(history.payload)")
                Text("Date: \(history.date)")
            }
        }
    }
}

#Preview {
    ContentView()
}
