//
//  DecodableExtension.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import Foundation

extension Decodable {
    static func decodeObject<T: Decodable>(data: Data?) -> T? {
        guard let data = data else { return nil }
        let object = try? JSONDecoder().decode(T.self, from: data)
        return object
    }
}
