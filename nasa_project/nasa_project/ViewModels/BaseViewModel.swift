//
//  BaseViewModel.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import Foundation

protocol ViewModel {
    
}

protocol StateChange {
    
}

class StatefulViewModel<SC: StateChange>: NSObject, ViewModel {
    
    typealias StateChangeHandler = (SC) -> Void
    
    private var stateChangeHandlers: [StateChangeHandler] = []
    
    final func addChangeHandler(_ handler: @escaping StateChangeHandler) {
        stateChangeHandlers.append(handler)
    }
    
    final func emit(change: SC) {
        stateChangeHandlers.forEach({ (handler: StateChangeHandler) in
            handler(change)
        })
    }
}
