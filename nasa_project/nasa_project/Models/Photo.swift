//
//  Picture.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import Foundation

final class PhotoList: Decodable {
    var photos: [Photo]
}

final class Photo: Decodable {
    var sol: Double
    var id: Double
    var earth_date: String
    var camera: Camera
    var img_src: String
    var rover: Rover
}

