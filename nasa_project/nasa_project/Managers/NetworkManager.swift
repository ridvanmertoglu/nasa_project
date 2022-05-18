//
//  NetworkManager.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//


import UIKit

typealias ServiceResponseBlock = (Data?, Error?) -> Void

final class NetworkManager {

    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchResponse(request: URLRequest, completion: ServiceResponseBlock?) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error,
                data != nil {
                completion?(nil, err)
                return
            }
            completion?(data, nil)
        }.resume()
    }
}
