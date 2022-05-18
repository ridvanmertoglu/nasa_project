//
//  URLRequestExtension.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import Foundation

import Foundation


extension URLRequest {
    init(path: String) {
        let url = URL(string: path)
        self = URLRequest(url: url!,
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
        httpMethod = "GET"
    }
}
