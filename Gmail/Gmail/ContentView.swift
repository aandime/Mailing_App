//  ContentView.swift
//  Gmail
//
//  Created by Andy Dong on 4/16/23.
//

import SwiftUI

struct Email: Identifiable {
    let id = UUID()
    let subject: String
    let sender: String
    let snippet: String
}

struct ContentView: View {
    let emails: [Email] = [
        Email(subject: "Welcome to Gmail", sender: "Google", snippet: "Welcome to Gmail, the best email service."),
        Email(subject: "Swift Weekly", sender: "Swift Newsletter", snippet: "Check out the latest Swift news and tutorials."),
        Email(subject: "Your order has shipped", sender: "Amazon", snippet: "Your order is on its way."),
        Email(subject: "Invitation: META Hiring @ Mon 9am", sender: "Calendar", snippet: "You have been invited to META Hiring.")
    ]

    var body: some View {
        NavigationView {
            List(emails) { email in
                NavigationLink(destination: EmailDetailView(email: email)) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(email.sender): \(email.subject)")
                            .font(.headline)
                        Text(email.snippet)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Inbox")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
