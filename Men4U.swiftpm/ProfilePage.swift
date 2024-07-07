import SwiftUI

struct ProfilePage: View {
    @State private var profileImageName = "Papa bear"
    @State private var isHelpExpanded = false
    
    @EnvironmentObject var fontSettings: FontSettings
    
    let imageNames = ["Papa bear", "Ducky", "Cute bunny"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Profile Image Section
                    ZStack(alignment: .bottomTrailing) {
                        Image(profileImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.top, 5)  // Adjusted top padding
                        
                        Button(action: {
                            // Action to change the profile image
                            if let currentIndex = imageNames.firstIndex(of: profileImageName) {
                                let nextIndex = (currentIndex + 1) % imageNames.count
                                profileImageName = imageNames[nextIndex]
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.purple)
                                .font(.system(size: 24))
                                .background(Circle().fill(Color.white).frame(width: 30, height: 30))
                        }
                        .offset(x: -10, y: -10)
                    }
                    
                    // Spacer below profile image
                    Spacer().frame(height: 35)  // Adjusted spacing
                    
                    // My Reviews Section
                    NavigationLink(destination: ReviewsPage().environmentObject(fontSettings)) {
                        Text("My Reviews")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                            .font(.system(size: fontSettings.fontSize))
                    }
                    
                    // Appearance Section
                    VStack(alignment: .leading) {
                        Text("Appearance")
                            .font(.headline).padding()
                        
                        NavigationLink(destination: ThemesPage().environmentObject(fontSettings)) {
                            Text("Themes")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(25)
                                .padding(.bottom, 10)
                                .font(.system(size: fontSettings.fontSize))
                        }
                        
                        HStack {
                            Text("Font Size")
                                .font(.system(size: fontSettings.fontSize)).padding()
                            Slider(value: $fontSettings.fontSize, in: 10...24)
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Help Section
                    VStack(alignment: .leading) {
                        Button(action: {
                            isHelpExpanded.toggle()
                        }) {
                            Text("Help")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .font(.system(size: fontSettings.fontSize))
                        }.padding(.top, 20)
                        
                        if isHelpExpanded {
                            VStack(alignment: .leading, spacing: 10) {
                                NavigationLink(destination: FAQsPage().environmentObject(fontSettings)) {
                                    Text("FAQs")
                                        .font(.system(size: fontSettings.fontSize))
                                }
                                Text("Phone: +1234567890")
                                    .font(.system(size: fontSettings.fontSize))
                                Text("Email: example@example.com")
                                    .font(.system(size: fontSettings.fontSize))
                            }
                            .padding(.top, 10)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    
                    // Logout Button
                    Button(action: {
                        navigateToLoginPage()
                    }) {
                        Text("Logout")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .font(.system(size: fontSettings.fontSize))
                    }
                }
            }
            .navigationBarTitle("My Profile ✨", displayMode: .inline)
        }
    }
    
    private func navigateToLoginPage() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: LoginPage())
                window.makeKeyAndVisible()
            }
        }
    }
}

struct ReviewsPage: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    var body: some View {
        VStack {
            Text("My Reviews")
                .font(.largeTitle)
                .bold()
                .italic()
                .padding(.top, 20)
                .padding(.bottom, 10)
                .navigationBarBackButtonHidden(true)
            
            ScrollView {
                VStack(spacing: 15) {
                    ReviewsRow(username: "Username", reviewText: "The food was pretty good", rating: 4.5)
                    ReviewsRow(username: "Username", reviewText: "The meal was average", rating: 3.0)
                    ReviewsRow(username: "Username", reviewText: "I did not like it at all", rating: 1.5)
                    ReviewsRow(username: "Username", reviewText: "It was delicious!", rating: 5.0)
                    ReviewsRow(username: "Username", reviewText: "Would not recommend", rating: 2.0)
                    ReviewsRow(username: "Username", reviewText: "Loved the flavors", rating: 4.0)
                }
                .padding()
            }
        }
        .padding(.horizontal)
        .font(.system(size: fontSettings.fontSize))
    }
}

struct ReviewsRow: View {
    @EnvironmentObject var fontSettings: FontSettings
    var username: String
    var reviewText: String
    var rating: Double
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(username)
                        .font(.headline)
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .padding(.top, 5)
                        Text("\(String(format: "%.1f", rating))")
                            .font(.headline)
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 15)
                }
                
                Text(reviewText)
                    .font(.system(size: fontSettings.fontSize))
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .background(Color(.systemGray5))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct ThemesPage: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    var body: some View {
        Text("Themes Page")
            .font(.system(size: fontSettings.fontSize))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Themes", displayMode: .inline)
    }
}

struct FAQsPage: View {
    @EnvironmentObject var fontSettings: FontSettings
    
    var body: some View {
        Text("FAQs Page")
            .font(.system(size: fontSettings.fontSize))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("FAQs", displayMode: .inline)
    }
}

// For previewing purposes
struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
            .environmentObject(FontSettings())
    }
}
