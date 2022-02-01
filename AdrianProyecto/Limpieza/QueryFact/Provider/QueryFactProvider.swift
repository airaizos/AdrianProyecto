//
//  QueryFactProvider.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import Foundation
import Alamofire

private let apiQueryFacts = "https://api.chucknorris.io/jokes/search?query=spain"
class QueryFactProviderFromAPI: QueryFactProviderContract {
    func getItems(_ completion: @escaping (Result<[QueryFact], ProviderError>) -> ()) {
        
        guard let url = URL(string: apiQueryFacts) else { completion(.failure(.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable {
            [weak self] (response: DataResponse<[QueryFact],AFError>) in
            switch response.result {
            case .success(let queryFact): completion(.success(queryFact))
            case .failure(let error): completion(.failure(.generic(error)))
                print(error)
            }
        }.validate()
    }
    
    
}
