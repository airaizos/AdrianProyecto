//
//  ListProvider.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 31/1/22.
//

import Foundation
import Alamofire

let apiCategories = "https://api.chucknorris.io/jokes/categories"

class ListProviderFromAPI: ListProviderContract {
    func getItems(_ completion: @escaping (Result<Category, ProviderError>) -> ()) {
        
        guard let url = URL(string: apiCategories) else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable { [weak self] (response: DataResponse<Category,AFError>) in
            switch response.result {
            case .success(let category): completion(.success(category))
            case .failure(let error): completion(.failure(.generic(error)))
            }
        }.validate()
    }
}
