import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Logo in a rectangular carousel
                    Ellipse()
                        .frame(width: 200, height: 1)
                        .foregroundColor(.white)
                        .overlay(
                            VStack(){
                                Text("Men4U✨")
                                    .font(.custom("Helvetica", size: 35)).bold().italic().bold()
                                    .foregroundColor(.purple)
                            }
                        )
                        .padding(.top, 80) // Adjust the top padding as needed
                    
                    // Greeting to the left using Spacer.
                    HStack {
                        Text("Welcome Back!")
                            .font(.custom("Helvetica", size: 22))
                            .bold()
                            .padding(.top, 100)
                        Spacer()
                    }
                    // Username entry box 40 pixels below the carou
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.purple.opacity(0.3))
                        .cornerRadius(5)
                        .padding(.top, 20)
                    
                    // Password entry box 20 pixels below the username box
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.purple.opacity(0.3))
                        .cornerRadius(5)
                        .padding(.top, 20)
                    
                    // Login button 35 pixels below the password box
                    Button(action: {
                        isLoggedIn = true // Set login status to true
                    }) {
                        Text("LOGIN")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.purple)
                            .cornerRadius(5)
                            .padding(.top, 40)
                    }
                    .fullScreenCover(isPresented: $isLoggedIn) {
                        HomePage().environmentObject(FontSettings())
                    }
                    
                    // Forgot password button 25 pixels below the login button
                    NavigationLink(destination: ForgotPasswordPage().environmentObject(FontSettings())) {
                        Text("Forgot password?")
                            .foregroundColor(.cyan)
                            .italic()
                        
                    }
                    .padding(.top, 50)
                    
                    // Sign up section 40 pixels below the forgot password button
                    HStack {
                        Text("Don’t have an account? ")
                            .bold()
                        NavigationLink(destination: SignUpPage().environmentObject(FontSettings())) {
                            Text("Sign up!")
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.top, 65)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
