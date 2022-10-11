//
//  InterestingInfoViewController.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import UIKit

class InterestingInfoViewController: UIViewController {

    var fetcher: InfoFetcher?
    var viewModel = AnimalViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .unspecified
        
        requestInfo()
    }
    
    override func loadView() {
        super.loadView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "AnimalInfoCell", bundle: nil), forCellReuseIdentifier: "AnimalInfoCell")
    }
    
    private func requestInfo() {
      guard let fetcher = fetcher else { fatalError("Missing dependencies") }
      fetcher.fetch { response in
        guard let response = response else { return }
        
        self.viewModel.resetData(response)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
      }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showThemePopover", let vc = segue.destination as? ThemeViewController {
            vc.themeDelegate = self
        } else if segue.identifier == "showAnimalDetails", let vc = segue.destination as? AnimalInfoViewController, let dict = sender as? [String: Any], let index = dict["index"] as? Int
        {
            guard let item = viewModel.item(by: index) else { return }
            vc.item = item
            vc.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        }
    }
}

extension InterestingInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAnimalDetails", sender: ["index": indexPath.row])
    }
    
}

extension InterestingInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: AnimalInfoCell =  tableView.dequeueReusableCell(withIdentifier: "AnimalInfoCell", for: indexPath) as? AnimalInfoCell, let item = viewModel.item(by: indexPath.row) {
            
            cell.nameLabel.text = item.name
            cell.latinNameLabel.text = item.latin_name
            if let url = URL(string: item.image_link) {
                cell.mainImageView.load(url: url)
            }
        
            return cell
            
        }
        
        return UITableViewCell()
    }
}

extension InterestingInfoViewController: ThemeDelegate {
    func changeTheme(_ theme: AppThemes) {
        overrideUserInterfaceStyle = theme.systemTheme()
    }
}

