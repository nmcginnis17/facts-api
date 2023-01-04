//
//  Fact.swift
//  apiing
//
//  Created by Nicholas McGinnis on 1/3/23.
//

import Foundation

extension ViewController {
    
    func caller(from url: String) {

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            var text: Response?
            do {
                text = try JSONDecoder().decode(Response.self, from: data)
                print(error as Any)
            } catch {
                debugPrint(error)
            }
            guard let json = text else {
                return
            }
            print(json.text)
            self.fact = json.text
        })

        task.resume()
    }
}
