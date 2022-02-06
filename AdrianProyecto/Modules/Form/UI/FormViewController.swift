//
//  FormViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit

struct FormViewModel {
    let savedData: String
}

class FormViewController: UIViewController, FormViewContract {
    
    func configure(with viewModel: FormViewModel?) {
        guard let viewModel = viewModel else { return }
        DispatchQueue.main.async {
            self.loadedDataLabel.text? =  viewModel.savedData
        }
    }
    
    var presenter: FormPresenterContract?
    
    @IBOutlet weak var cifTextField: UITextField!  {
        didSet {
            cifTextField.placeholder = NSLocalizedString("user_form_CIF_text_field_placeholder", comment: "")
            cifTextField.textColor = UIColor(named: "primaryColor")
            cifTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var companyNameTextField: UITextField! {
        didSet {
            companyNameTextField.placeholder = NSLocalizedString("user_form_company_text_field_placeholder", comment: "")
            companyNameTextField.textColor = UIColor(named: "primaryColor")
            companyNameTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var addressTextField: UITextField! {
        didSet {
            addressTextField.placeholder = NSLocalizedString("user_form_address_text_field_placeholder", comment: "")
            addressTextField.textColor = UIColor(named: "primaryColor")
            addressTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    
    @IBOutlet weak var countryCheckDigitsTextField: UITextField!   {
        didSet {
            countryCheckDigitsTextField.placeholder = NSLocalizedString("user_form_country_check_digits_text_field_placeholder", comment: "")
            countryCheckDigitsTextField.textColor = UIColor(named: "primaryColor")
            countryCheckDigitsTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var bankTextField: UITextField!  {
        didSet {
            bankTextField.placeholder = NSLocalizedString("user_form_bank_text_field_placeholder", comment: "")
            bankTextField.textColor = UIColor(named: "primaryColor")
            bankTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var officeTextField: UITextField! {
        didSet {
            officeTextField.placeholder = NSLocalizedString("user_form_ofice_text_field_placeholder", comment: "")
            officeTextField.textColor = UIColor(named: "primaryColor")
            officeTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var accountCheckDigitsTextField: UITextField!  {
        didSet {
            accountCheckDigitsTextField.placeholder = NSLocalizedString("user_form_account_check_digits_text_field_placeholder", comment: "")
            accountCheckDigitsTextField.textColor = UIColor(named: "primaryColor")
            accountCheckDigitsTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var accountTextField: UITextField! {
        didSet {
            accountTextField.placeholder = NSLocalizedString("user_form_account_text_field_placeholder", comment: "")
            accountTextField.textColor = UIColor(named: "primaryColor")
            accountTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var phoneTextField:  UITextField!  {
        didSet {
            phoneTextField.placeholder = NSLocalizedString("user_form_phone_text_field_placeholder", comment: "")
            phoneTextField.textColor = UIColor(named: "primaryColor")
            phoneTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = NSLocalizedString("user_form_email_text_field_placeholder", comment: "")
            emailTextField.textColor = UIColor(named: "primaryColor")
            emailTextField.backgroundColor = UIColor(named: "backgroundSecondary")
        }
    }
    @IBOutlet weak var saveButtonOutlet: UIButton! {
        didSet {
            saveButtonOutlet.setTitle(NSLocalizedString("user_form_save_button_outlet", comment: ""), for: .normal)
        }
    }
    @IBOutlet weak var customerFormLabel: UILabel! {
        didSet {
            customerFormLabel.text = NSLocalizedString("user_form_customer_form_label", comment: "")
            customerFormLabel.textColor = UIColor(named: "textPrimary")
            customerFormLabel.backgroundColor = UIColor(named: "backgroundPrimary")
        }
    }
    @IBOutlet weak var loadedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        initialConfiguration()
    }
    
    @IBAction func TextFieldDidChange(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    @IBAction func didPressSave(_ sender: UIButton) {
        presenter?.didPressSend()
    }
    
    
   @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension FormViewController {
    static func createFromStoryboard() -> FormViewController {
        return UIStoryboard(name: "FormViewController", bundle: .main).instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
    }
    
    func showValidationError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Verifica los datos", message: "No puede haber campos vacios", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Entendido", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showValidation() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Datos guardados", message: "Nos pondremos en contacto lo antes posible", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    private func initialConfiguration(){
        view.backgroundColor = UIColor(named: "backgroundPrimary")
        loadedDataLabel.textColor = UIColor(named: "textPrimary")
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
}

extension FormViewController {
    private func didUpdateValidation(input: UITextField, valid: Bool) {
        DispatchQueue.main.async {
            input.backgroundColor = valid ? .systemBackground : .systemPink
        }
    }
    
    private func textFieldDidChange(_ textField: UITextField) {
        switch textField {
        case cifTextField: presenter?.didUpdateCif(textField.text)
        case companyNameTextField: presenter?.didUpdateCompanyName(textField.text)
        case addressTextField: presenter?.didUpdateAddress(textField.text)
        case countryCheckDigitsTextField: presenter?.didUpdateCountryCheckDigits(textField.text)
        case bankTextField: presenter?.didUpdateBank(textField.text)
        case officeTextField: presenter?.didUpdateBankOffice(textField.text)
        case accountCheckDigitsTextField: presenter?.didUpdateAccountCheckDigits(textField.text)
        case accountTextField: presenter?.didUpdateAccount(textField.text)
        case phoneTextField: presenter?.didUpdatePhone(textField.text)
        case emailTextField: presenter?.didUpdateEmail(textField.text)
        default:
            break
        }
    }
    
    func didValidateCif(_ valid: Bool) {
        didUpdateValidation(input: cifTextField, valid: valid)
    }
    func didValidateCompanyName(_ valid: Bool) {
        didUpdateValidation(input: companyNameTextField, valid: valid)
    }
    func didValidateAddress(_ valid: Bool) {
        didUpdateValidation(input: addressTextField, valid: valid)
    }
    func didValidateCountryCheckDigits(_ valid: Bool) {
        didUpdateValidation(input: countryCheckDigitsTextField, valid: valid)
    }
    func didValidateBank(_ valid: Bool) {
        didUpdateValidation(input: bankTextField, valid: valid)
    }
    func didValidateBankOffice(_ valid: Bool) {
        didUpdateValidation(input: officeTextField, valid: valid)
    }
    func didValidateAccountCheckDigits(_ valid: Bool) {
        didUpdateValidation(input: accountCheckDigitsTextField, valid: valid)
    }
    func didValidateAccount(_ valid: Bool) {
        didUpdateValidation(input: accountTextField, valid: valid)
    }
    func didValidatePhone(_ valid: Bool) {
        didUpdateValidation(input: phoneTextField, valid: valid)
    }
    func didValidateEmail(_ valid: Bool) {
        didUpdateValidation(input: emailTextField, valid: valid)
    }
}


extension FormViewController: UITextViewDelegate {
    
    private func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case cifTextField: companyNameTextField.becomeFirstResponder()
        case companyNameTextField: addressTextField.becomeFirstResponder()
        case addressTextField: countryCheckDigitsTextField.becomeFirstResponder()
        case countryCheckDigitsTextField: bankTextField.becomeFirstResponder()
        case bankTextField: officeTextField.becomeFirstResponder()
        case officeTextField: accountCheckDigitsTextField.becomeFirstResponder()
        case accountCheckDigitsTextField: accountTextField.becomeFirstResponder()
        case accountTextField: phoneTextField.becomeFirstResponder()
        case phoneTextField: textField.resignFirstResponder()
        default: break
        }
        return true
    }
}
