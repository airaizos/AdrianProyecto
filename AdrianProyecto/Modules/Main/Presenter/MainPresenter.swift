//
//  MainPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.
//

import Foundation

struct FactViewModel {
    let iconURL: URL?
    let value: String
}

class MainPresenter: MainPresenterContract, MainInteractorOutputContract {
    
    weak var view: MainViewContract?
    var interactor: MainInteractorContract?
    var wireframe: MainWireframeContract?
    var fetchFacts: MainProviderContract?
    
    private var fact:Fact = Fact(iconURL: URL(string: "urlvacia"), value: "Init vacio")
    
    func viewDidLoad() {
        interactor?.output  = self
        interactor?.fetchItems()
        view?.configure(with: factViewModel())
    }
    func didFetch(fact: Fact) {
        self.fact = fact
}
    
    func factViewModel() -> FactViewModel {
        let item = fact
        return item.toMainFactViewModel
    }

    func didFetchFail() {
        self.fact = Fact(iconURL: URL(string: "error"), value: "error")
    }
}
