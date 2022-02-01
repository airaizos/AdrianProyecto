//
//  FetchZooUseCase.swift
//  AnimalesDelMundo
//
//  Created by Adrian Iraizos Mendoza on 23/1/22.
//

import Foundation

protocol FetchZooUseCase {
    func fetchZoo(completion: @escaping ([Animal])->Void)
}

class FetchZooFromAPI: FetchZooUseCase {
    func fetchZoo(completion: @escaping ([Animal]) -> Void) {
        guard let url = URL(string: "https://zoo-animal-api.herokuapp.com/animals/rand") else {
            completion([])
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            guard let data = data else { completion([])
                return
            }
            do {
                let animals = try JSONDecoder().decode([Animal].self, from: data)
                completion(animals)
            } catch {
                completion([])
            }
        }.resume()
    }
}
