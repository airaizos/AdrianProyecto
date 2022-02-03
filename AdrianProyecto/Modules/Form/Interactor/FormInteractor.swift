//
//  FormInteractor.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

class FormInteractor: FormInteractorContract {
    
    var formProvider: FormProviderContract?
    
    
    func saveForm(formModel: FormModel) {
        formProvider?.saveForm(formModel)
    }
    
}
