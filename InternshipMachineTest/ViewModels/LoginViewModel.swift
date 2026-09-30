import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isAuthenticated = false
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and Password are mandatory."
            return
        }
        guard isValidEmail(email) else {
            errorMessage = "Invalid email format."
            return
        }
        if email == "test@example.com" && password == "password123" {
            isAuthenticated = true
            errorMessage = ""
        } else {
            errorMessage = "Invalid email or password."
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
