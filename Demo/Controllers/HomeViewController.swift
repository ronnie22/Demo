//
//  HomeViewController.swift
//  Demo
//
//  Created by Raunak Sinha on 03/06/21.
//

import UIKit

protocol MyCustomCellDelegator {
    func callSegueFromCell()
}

class HomeViewController: UIViewController {
    
    var categoryData = ["Supermarkets","Bakery","Fruits and Vegetables","Organic Shops","Butcher Shops"]
    var count = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: K.fCellNibName, bundle: nil), forCellReuseIdentifier: K.firstCell)
        tableView.register(UINib(nibName: K.sCellNibName, bundle: nil), forCellReuseIdentifier: K.secondCell)
    }

    @IBAction func addtapped(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { [self] (action) in
            print("Done")
            let text = textField.text!
            categoryData.append(text)
            print(self.categoryData)
            count = 0
            tableView.reloadData()
//
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            if alertTextField.text != nil {
                textField = alertTextField
            }
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        
    }
}


//MARK: - TableView

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let n = categoryData.count
        if n <= 3 {
            return n
        }
        else {
            let c = n/4
            print(n-c)
            return n-c
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(count)
            
            if indexPath.row%3 < 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: K.firstCell, for: indexPath) as! FTableViewCell
                cell.nameLabel.text = categoryData[indexPath.row+count]
                
                print(categoryData.count,count,categoryData[indexPath.row+count],indexPath.row+count,indexPath.row)
                
                
                cell.delegate = self
                return cell
            }else {
                
                if categoryData.count-indexPath.row == 2{
                    let cell = tableView.dequeueReusableCell(withIdentifier: K.firstCell, for: indexPath) as! FTableViewCell
                    cell.nameLabel.text = categoryData[indexPath.row+count]
                    
                    
                    print(categoryData.count,count,categoryData[indexPath.row+count],indexPath.row+count,indexPath.row)
                    
                    
                    cell.delegate = self
                    return cell
                }
                else{
                    let cell1 = tableView.dequeueReusableCell(withIdentifier: K.secondCell, for: indexPath) as! STableViewCell
                    cell1.firstNameLabel.text = categoryData[indexPath.row+count]
                    cell1.secondNameLabel.text = categoryData[indexPath.row+count+1]
                    print(categoryData.count,count,categoryData[indexPath.row+count],categoryData[indexPath.row+count+1],indexPath.row+count,indexPath.row)
                    count += 1
                    cell1.delegate = self
                    return cell1
                }
            }
        
    }
    
}


extension HomeViewController: MyCustomCellDelegator {
    func callSegueFromCell() {
        performSegue(withIdentifier: K.detailViewSegue, sender: self)
    }
}
