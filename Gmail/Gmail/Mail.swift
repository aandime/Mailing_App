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
            Spacer()
            
            if(email.sender == "META"){
                Image("Meta").resizable().scaledToFit()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            if(email.sender == "Google"){
                Image("Google").resizable().scaledToFit()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            if(email.sender == "Amazon"){
                Link("Check Order Status!", destination: URL(string: "https://www.amazon.com/")!)
                Image("Amazon").resizable()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            if(email.sender == "Swift Newsletter"){
                Image("Newspaper").resizable().scaledToFit()
                Link("Click here for more news!", destination: URL(string: "https://www.newyorker.com/culture/infinite-scroll/buzzfeed-blue-check-marks-and-the-end-of-an-internet-era")!)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
        }
        .padding()
        Spacer()
    }
}

struct EmailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailDetailView(email: Email(subject: "Example Email", sender: "John Doe", snippet: "This is an example email snippet."))
    }
}

