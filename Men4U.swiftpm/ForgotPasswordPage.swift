import SwiftUI

struct ForgotPasswordPage: View {
    @State private var email: String = ""
    @State private var showConfirmationMessage: Bool = false
    
    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .padding()
            
            TextField("Enter your email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Simulate sending a reset link
                showConfirmationMessage = true
            }) {
                Text("Send Reset Link")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            .padding()
            
            if showConfirmationMessage {
                Text("A reset link has been sent to your email.")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ForgotPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordPage()
    }
}
