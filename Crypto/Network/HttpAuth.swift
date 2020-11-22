//
//  HttpAuth.swift
//  Crypto
//
//  Created by Tanacom on 11/20/20.
//

import SwiftUI
import Combine


struct ServerMessage: Decodable {
    
    let message: String
    
}

//BindableObject has been renamed to ObservableObject.

class HttpAuth:ObservableObject {
    
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
    

    func checkDetails(username: String, password: String) {
        
        guard let url = URL(string:Cons.API)
        
        else { return }
        
        let parameters = ["username": username, "password": password]
        
        let postData = parameters.queryString.data(using: .utf8)
        
        var request = URLRequest(url: url)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
           
            
            
            if let decodedResponse = try? JSONDecoder().decode(ServerMessage.self, from: data) {
                print(decodedResponse)
                
                if decodedResponse.message == "ok" {
                    DispatchQueue.main.async {
                        self.authenticated = true
                    }
                }
                
                return
            }
            
        }
        
        task.resume()
        
    }
    
}


extension Dictionary {
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return output
    }
}
