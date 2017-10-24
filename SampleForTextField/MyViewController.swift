//
//  ViewController.swift
//  SampleForTextField
//
//  Created by Admin on 24/10/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 30
        registerNibForTableViewCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - Table View Methods

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerNibForTableViewCell() {
        
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        myTableView.register(nib, forCellReuseIdentifier: "mycellreuseidentifier")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycellreuseidentifier", for: indexPath) as! MyTableViewCell
        
        // Uncomment this and delegate will work
        
        //cell.myTextField.delegate = self
        
        return cell
    }
    
}

// MARK: - Text Field methods

extension MyViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
}

