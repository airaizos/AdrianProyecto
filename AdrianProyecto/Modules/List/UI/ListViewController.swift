//
//  ListViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import UIKit



class ListViewController: UIViewController, ListViewContract, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listView: UITableView!
    
    var presenter: ListPresenterContract?
    
    func reloadData() {
        DispatchQueue.main.async {
            self.listView.reloadData()
        }
    }

    override func viewDidLoad() {
        listView.dataSource = self
        listView.delegate  = self
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension ListViewController {
    static func createFromStoryboard() -> ListViewController {
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numCategories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = presenter?.cellViewModel(at: indexPath),  let cell = listView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? ListViewCell else  {
            fatalError("fatal \(debugDescription)")
        }
        cell.configure(with: viewModel)
        
        return cell
    }
}
