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

        let body = ["username": username, "password": password]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    
             print(request)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data
            else { return }
            
       
            
//            do {

             
                let decoder = JSONDecoder()
                let finalData  = try! decoder.decode(ServerMessage.self, from: data)
                
                
                print(finalData)
                
                if finalData.message == "ok" {
                    
                    
                    DispatchQueue.main.async {
                        self.authenticated = true
                    }
                }


//            }
            
//            catch  {
//                print(error)
//            }
//

            
            
//
//            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)

//           print(finalData)
          
    
        }.resume()
    
    }
    
}
