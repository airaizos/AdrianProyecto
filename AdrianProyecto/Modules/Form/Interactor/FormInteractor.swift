//
//  FormInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

class FormInteractor: FormInteractorContract {
    weak var output: FormInteractorOutputContract?
    
    var formProvider: FormProviderContract?
    
    
    func saveForm(formModel: FormModel) {
        formProvider?.saveForm(formModel)
        print("todoOK \(formModel)")
    }
    
    func fetchForm() {
        formProvider?.loadForm({ form in
            guard let form = form else { return }
            self.output?.didFetch(form: form)
        })
    }
    
    
}
