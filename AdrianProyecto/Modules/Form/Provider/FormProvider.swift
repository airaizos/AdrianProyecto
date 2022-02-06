//
//  FormProvider.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 2/2/22.
//

import Foundation
//


class FormProvider: FormProviderContract {
    
    private let fileManager: FileManager
    private let filename: String
    
    init(fileManager: FileManager = FileManager.default,filename: String = "FormData") {
        self.fileManager = fileManager
        self.filename = filename
    }
    
    private var  fileURL: URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("\(filename).plist")
        return url
    }
    
    func saveForm(_ form: FormModel) {
        guard let url = fileURL else {
            return
        }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(form)
            try data.write(to: url)
        } catch {
            //MARK: TODO ERROR
        }
    }
    
    func loadForm(_ completion: @escaping (FormModel?) -> ()) {
        DispatchQueue.global().async {
            guard let url = self.fileURL else {
                completion(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            do {
                let form = try PropertyListDecoder().decode(FormModel.self, from: data)
                completion(form)
                
            } catch {
            }
        }
    }
}


