//
//  MainPresenter.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 30/1/22.

import Foundation

struct FactViewModel {
    let iconURL: URL?
    let value: String
}

class MainPresenter: MainPresenterContract {
    
    weak var view: MainViewContract?
    var interactor: MainInteractorContract?
    var wireframe: MainWireframeContract?
    var fetchFacts: MainProviderContract?
    
    var fact:Fact  = Fact(iconURL: URL(string: "error"), value: "error")
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchItems()
    }
    
    func didPressRandomFact() {
        
        interactor?.output = self
        interactor?.fetchItems()
    }
}

extension MainPresenter: MainInteractorOutputContract{
    func didFetch(fact: Fact) {
        self.fact = fact
        view?.configure(with: fact.toMainFactViewModel)
    }
    
    func didFetchFail(fact: Fact) {
        self.fact = Fact(iconURL: URL(string: "error"), value: "\(fact.value)")
        view?.configure(with: fact.toMainFactViewModel)
    }
}
