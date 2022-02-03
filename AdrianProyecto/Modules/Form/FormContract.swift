//
//  FormContract.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

protocol FormViewContract {
    var presenter: FormPresenterContract? { get set }
    
    func showValidationError()
    
    func didValidateCif(_ valid: Bool)
    func didValidateCompanyName(_ valid: Bool)
    func didValidateAddress(_ valid: Bool)
    func didValidateCountryCheckDigits(_ valid: Bool)
    func didValidateBank(_ valid: Bool)
    func didValidateBankOffice(_ valid: Bool)
    func didValidateAccountCheckDigits(_ valid: Bool)
    func didValidateAccount(_ valid: Bool)
    func didValidatePhone(_ valid: Bool)
    func didValidateEmail(_ valid: Bool)
    
}

protocol FormPresenterContract {
    var view: FormViewContract? { get set }
    
    
    func didPressSend()
    func didUpdateCif(_ cif: String?)
    func didUpdateCompanyName(_ companyName: String?)
    func didUpdateAddress(_ address: String?)
    func didUpdateCountryCheckDigits(_ countryCheckDigits: String?)
    func didUpdateBank(_ bank: String?)
    func didUpdateBankOffice(_ bankOffice: String?)
    func didUpdateAccountCheckDigits(_ accountCheckDigits: String?)
    func didUpdateAccount(_ account: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateEmail(_ email: String?)
}

protocol FormInteractorContract {
    
    func saveForm(formModel: FormModel)
}

protocol FormProviderContract {
    
    func saveForm(_ form: FormModel)
    
    func loadForm(_ completion: @escaping (FormModel?) -> ())
    
}
