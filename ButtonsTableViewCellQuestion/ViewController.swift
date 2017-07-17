//
//  ViewController.swift
//  ButtonsTableViewCellQuestion
//
//  Created by Reinier Melian on 17/07/2017.
//  Copyright © 2017 Pruebas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dictOfSelectedsCells : [Int:String?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ButtonTableViewCell.cellHeigth
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as? ButtonTableViewCell
        {
            cell.selectionStyle = .none
            var selectedText : String?
            if let currentSelectedText = self.dictOfSelectedsCells[indexPath.row]
            {
                selectedText = currentSelectedText
            }
            
            cell.setupWithClosure(texts:["Variant1","Variant2","Variant3","Variant4"], textSelected: selectedText, closure: { [weak self] (selected) in
                debugPrint(indexPath)
                self?.dictOfSelectedsCells[indexPath.row] = selected
                tableView.reloadRows(at: [indexPath], with: .none)
            })
    
            return cell
        }
        assert(false, "this must not happen")
    }
}

