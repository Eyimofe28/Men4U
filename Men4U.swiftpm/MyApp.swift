import SwiftUI

class FontSettings: ObservableObject {
    @Published var fontSize: CGFloat = 14
}

@main

struct YourApp: App {
    @StateObject private var fontSettings = FontSettings()
    
    var body: some
    
    Scene {
        WindowGroup {
            LoginPage()
                .environmentObject(fontSettings)
        }
    }
}

