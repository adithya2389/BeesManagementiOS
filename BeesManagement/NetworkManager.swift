//
//  NetworkManager.swift
//  BeesManagement
//
//  Created by Tammavarapu, Adithya Kalyan on 12/7/16.
//  Copyright © 2016 HoneyWell. All rights reserved.
//

import UIKit
import BMSCore

class NetworkManager {
    
    static let urlSession = BMSURLSession(configuration: .default, delegate: nil, delegateQueue: nil)
    
    static func login(username: String, password: String, completion: @escaping (Any?)->()) {
        
        var request = URLRequest(url: URL(string: "http://beesmanagment.mybluemix.net/api/session")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = ["username": username, "password": password]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: bodyData, options: [])
        }
        catch {}
        
        self.makeRequest(request: request, completion: completion)
    }
    
    static func users(completion: @escaping (Any?)->()) {
        
        var request = URLRequest(url: URL(string: "http://beesmanagment.mybluemix.net/api/users")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.makeRequest(request: request, completion: completion)
    }
    
    static func makeRequest(request: URLRequest, completion: @escaping (Any?)->()) {
        self.urlSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == 401 {
                    OperationQueue.main.addOperation {
                        completion(nil)
                    }
                    return;
                }
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response data: \(responseString)")
                let jsonObject = try! JSONSerialization.jsonObject(with: data, options:[])
                OperationQueue.main.addOperation {
                    completion(jsonObject)
                }
            }
            if let error = error {
                print("Error: \(error)")
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            }.resume()
    }

}
