//
//  RegistrationView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/9/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel
    
    init(authService: AuthService) {
        let vm = RegistrationViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // logo image
            Image("tiktok-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            // text fields
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }
            
            // login button
            Button {
                Task {
                    await viewModel.createUser(withEmail: email,
                                               password: password,
                                               fullname: fullname,
                                               username: username)
                }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 350, height: 44)
                    .foregroundStyle(.white)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.7)

            Spacer()
            Divider()
            
            // go back to sign in
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty 
        && email.contains("@")
        && !password.isEmpty
        && !fullname.isEmpty
        && !username.isEmpty
    }
}

#Preview {
    RegistrationView(authService: AuthService())
}
