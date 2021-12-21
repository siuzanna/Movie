//
//  MainScreenServiceProtocol.swift
//  Movie
//
//  Created by siuzanna on 18/12/21.
//

import Foundation

protocol MainScreenServiceProtocol {
    func getMenu(completion: @escaping (_ success: Bool, _ results: [Movies]?, _ error: String?) -> Void)
}

class MainScreenService: MainScreenServiceProtocol {
    let networkService: NetworkService = NetworkService()

    func getMenu(completion: @escaping (Bool, [Movies]?, String?) -> Void) {
        networkService.sendRequest(
            urlRequest: MainScreenRouter.getAllPosts.createURLRequest(),
            successModel: [Movies].self
        ) { [weak self] (result) in
            guard self != nil else {return}
            switch result {
                case .success(let model):
                    completion(true, model, nil)
                case .badRequest(let error):
                    print(error)
                case .failure(let error):
                    print("Failed11б \(error)")
            }
        }
    }
}