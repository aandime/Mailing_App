//
//  Network.swift
//  Gmail
//
//  Created by Andy Dong on 4/18/23.
//

import Foundation

//struct Network{
//    private static let baseUrl = "code.com"
//
//    enum endpoint{
//        case emailMessages(
//            path: String = "/json/email.json"
//        )
//        var url: URL? {
//            var components = URLComponents()
//            components.scheme = "https:"
//            components.host = baseUrl
//            components.path = path
//
//            return components.url
//        }
//        private var path: String {
//            switch self{
//            case .emailMessages(let path):
//                return path
//            }
//        }
//    }
//    static func getMail(at end: endpoint = .emailMessages(), completion: @escaping (([Mail.Emails]) -> Void)){
//        if let url = end.url{
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    print(" An Error has Occurred!", error)
//                }
//
//                if let data = data {
//                    do{
//                        let mail = try JSONDecoder().decode(Mail.self, from: data)
//                        completion(mail.messages)
//                    }
//                    catch let error{
//                        print("Error", error.localizedDescription)
//                    }
//                }
//            }
//        }
//    }
//
//
//}
