//
//  MainInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.
//

import Foundation
import SwiftUI

class MainInteractor: MainInteractorContract {
    weak var output: MainInteractorOutputContract?
    var mainProvider: MainProviderContract?
 
    func fetchItems() {
        mainProvider?.getMainFact({ result in
            switch result {
            case .success(let fact): self.output?.didFetch(fact: fact)
            case .failure(let error): self.output?.didFetchFail(fact: Fact(iconURL: URL(string: "error"), value: error.localizedDescription))
            }
        })
    }
}
