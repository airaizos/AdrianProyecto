//
//  Form.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation

struct FormModel: Codable {
    
    var cif: String?
    var companyName: String?
    var address: String?
    var countryCheckDigits: String?
    var bank: String?
    var bankOffice: String?
    var accountCheckDigits: String?
    var account: String?
    var phone: String?
    var email: String?
}

extension FormModel {
    
    var isValidCif: Bool {
        validate(field: cif, type: .string, minValue: 9, maxValue: 9)
    }
    var isValidCompanyName: Bool {
        validate(field: companyName, type: .string, minValue: 6, maxValue: 64)
    }
    var isValidAddress: Bool {
        validate(field: address, type: .string, minValue: 8,maxValue: 64)
    }
    var isValidCountryCheckDigits: Bool {
        validate(field: countryCheckDigits, type: .int, minValue: 2, maxValue: 2)
    }
    var isValidBank: Bool {
        validate(field: countryCheckDigits, type: .int, minValue: 2, maxValue: 4)
    }
    var isValidBankOffice: Bool {
        validate(field: bankOffice, type: .int, minValue: 4, maxValue: 4)
    }
    var isValidAccountCheckDigits: Bool {
        validate(field: accountCheckDigits, type: .int, minValue: 2, maxValue: 2)
    }
    var isValidAccount: Bool {
        validate(field: account, type: .int, minValue: 10, maxValue: 10)
    }
    var isValidPhone: Bool {
        validate(field: phone, type: .int, minValue: 9, maxValue: 9)
    }
    var isValidEmail: Bool {
        validate(field: email, type: .string, minValue: 6, maxValue: 30)
    }
    var isValidForm: Bool {
        if cif == "Chuck Norris" || isValidCif && isValidCompanyName && isValidAddress && isValidCountryCheckDigits && isValidBank && isValidBankOffice && isValidAccountCheckDigits && isValidAccount && isValidPhone && isValidEmail {
            return  true
        } else {
            return false
        }
    }
    
    func validate(field: String?,type: Type, minValue: Int, maxValue: Int) -> Bool {
        guard let field = field else { return false }
        if type == Type.int {
            guard let _ = Int(field) else { return false }
        }
        if field.count < minValue || field.count > maxValue || field.isEmpty {
            return false
        }
        return !field.isEmpty
    }
    
    var toFormViewModel: FormViewModel {
        return FormViewModel(savedData: "\(cif ?? "No data") - \(companyName ?? ""), \(phone ?? "")")
    }
}

enum Type {
case string, int
}
