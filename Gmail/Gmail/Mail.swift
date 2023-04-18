//
//  Mail.swift
//  Gmail
//
//  Created by Andy Dong on 4/16/23.
//

import SwiftUI

struct EmailDetailView: View {
    let email: Email

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(email.sender)
                .font(.title2)
                .bold()
            Text(email.subject)
                .font(.title)
                .bold()
            Divider()
            Text(email.snippet)
                .font(.body)
        }
        .padding()
        .navigationTitle("Email")
    }
}

struct EmailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailDetailView(email: Email(subject: "Example Email", sender: "John Doe", snippet: "This is an example email snippet."))
    }
}

