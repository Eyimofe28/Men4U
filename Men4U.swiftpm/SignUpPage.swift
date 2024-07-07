import SwiftUI

struct SignUpPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showConfirmationMessage = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal, 86)
                    .padding(.top, 20)
                
                Text("First Name")
                    .italic()
                    .padding(.top, 20)
                
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                
                Text("Last Name")
                    .italic()
                    .padding(.top, 30)
                
                TextField("Last Name", text: $lastName)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                
                Text("School Email (.edu)")
                    .italic()
                    .padding(.top, 30)
                
                TextField("School Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                
                Text("Password (min 8 characters)")
                    .italic()
                    .padding(.top, 30)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                
                Text("Confirm Password")
                    .italic()
                    .padding(.top, 30)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                
                Button(action: {
                    // Implement account creation logic here
                    showConfirmationMessage = true
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 80)
                }
                
                if showConfirmationMessage {
                    Text("A confirmation email has been sent to your email address.")
                        .foregroundColor(.green)
                        .padding(.top, 20)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
