//
//  PictureViewModel.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import Foundation

struct PhotoViewModelState {
    enum Change: StateChange {
        case fetching
        case succeeded
        case failed(message: String?)
    }
}

final class PhotoViewModel: StatefulViewModel<PhotoViewModelState.Change> {
    
    var photoList: PhotoList?
    
    func fetchPictures() {
        let path = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY&page=1"
        emit(change: .fetching)
        NetworkManager.shared.fetchResponse(request: URLRequest(path: path)) { [weak self] (data, error) in
            if let err = error {
                self?.emit(change: .failed(message: err.localizedDescription))
                return
            }
            guard let data = data else {
                self?.emit(change: .failed(message: "Data is empty."))
                return
            }
            
            self?.photoList = PhotoList.decodeObject(data: data)
            self?.emit(change: .succeeded)
        }
    }
    
}
