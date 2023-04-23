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
    var timestamp = Date()
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            NavigationLink(destination: TabView()) {
                Image(systemName: "line.horizontal.3")
            }
            TextField("Search in mail", text: $text)
            Image(systemName: "person.crop.circle.fill").resizable().frame(width: 23, height: 23, alignment: .trailing)
            Button(action: {
                let url = URL(string: "https://mail.google.com/mail/mu/mp/19/#co")
                UIApplication.shared.open(url!)
            }) {
                Image(systemName: "envelope.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct TabView: View {
    var body: some View {
        Text("This is a new page!")
    }
}

struct ContentView: View {
@State var searchText: String = ""
let emails: [Email] = [
    Email(subject: "Welcome!",sender: "Google", snippet: "Welcome to Gmail, the best email service.", timestamp: Date(timeIntervalSinceNow: -7200)),
    Email(subject: "Swift Weekly", sender: "Swift Newsletter", snippet: "Check out the latest Swift news and tutorials! Coming to you soon!", timestamp: Date(timeIntervalSinceNow: -10800)),
    Email(subject: "Your order has been Delayed", sender: "Amazon", snippet: "Your order has been delayed, it will arrive tomorrow by 9pm. We are sorry for the inconvenience!", timestamp: Date(timeIntervalSinceNow: -21600)),
    Email(subject: "Invitation: META Hiring @ Mon 9am", sender: "META", snippet: "You have been invited to META Hiring! Come join us Monday at 9am via zoom to tune in and get a chance to meet META Software Engineers and more!", timestamp: Date(timeIntervalSinceNow: -43200)),
    Email(subject: "Dinner?", sender: "Aarjav J", snippet: "Just Kidding. Or was I?", timestamp: Date(timeIntervalSinceNow: -172800)),
    Email(subject: "Hanging-out", sender: "Chase A", snippet: "Yo, wanna grab a drink sometime?", timestamp: Date(timeIntervalSinceNow: -86400)),
    Email(subject: "You are broken", sender: "Lasya K", snippet: "Go to therapy. Fix yourself.", timestamp: Date(timeIntervalSinceNow: -172800))
]

var filteredEmails: [Email] {
    if searchText.isEmpty {
        return emails
    } else {
        return emails.filter { $0.sender.localizedCaseInsensitiveContains(searchText) || $0.subject.localizedCaseInsensitiveContains(searchText) || $0.snippet.localizedCaseInsensitiveContains(searchText) }
    }
}
    
@State var isClicked = false
    var body: some View {
    VStack {
    SearchBar(text: $searchText)
    HStack {
        Text("All Inboxes")
            .foregroundColor(.gray)
            .font(.subheadline)
        Spacer()
    }
    Spacer(minLength: 0)
    NavigationView {
        List(filteredEmails) { email in
            NavigationLink(destination: EmailDetailView(email: email)) {
                HStack(alignment: .top) {
                    if(email.sender == "Google"){
                        Image("Google2")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "META"){
                        Image("Meta2")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "Amazon"){
                        Image("Amazon2")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "Swift Newsletter"){
                        Image("Swift")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "Chase A"){
                        Image("Chase")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "Aarjav J"){
                        Image("Aarjav")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    if(email.sender == "Lasya K"){
                        Image("Lasya")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(email.sender): ")
                            .font(.headline)
                            .lineLimit(1)
                        Text(email.subject)
                            .lineLimit(1)
                        HStack {
                            Text(email.snippet)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                            Spacer()
                            Text(email.timestamp, style: .time)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    Button {
                        isClicked.toggle()
                    } label: {
                        if isClicked {
                            Image(systemName:"star.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName:"star")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.vertical, 5)
                .padding(.trailing, 10)
            }
        }
    }
        HStack {
            Spacer()
            Button(action: {
                if let url = URL(string: "mailto:") {
                    UIApplication.shared.open(url)
                }
            }) {
                Image(systemName: "envelope.badge")
                    .resizable()
                    .frame(width: 30, height: 23)
                    .foregroundColor(.gray)
            }
            Spacer()
            Spacer()
            Button(action: {
                if let url = URL(string: "https://meet.google.com/?pli=1") {
                    UIApplication.shared.open(url)
                }
            }) {
                Image(systemName: "video")
                    .resizable()
                    .frame(width: 30, height: 23)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

}

struct NewMessageView: View{
    var body: some View {
        Text("This is the Envelope view!")
    }
}

struct VideoView: View {
    var body: some View {
        Text("This is the Video view!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
