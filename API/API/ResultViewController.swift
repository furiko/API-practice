//
//  ResultViewController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var createDate: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    @IBOutlet weak var numOfFork: UILabel!
    @IBOutlet weak var doesIssueExist: UILabel!
    var result: GHAPIModel.Repository!
    let controller = ViewGHAPIController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setResult()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   func setResult() {   //set to TextField
        result = controller.getResult()
        repoName.text = result.name
        createDate.text = result.createdAt
        updateDate.text = result.updatedAt
        numOfFork.text = String(result.forksCount)
    
        if result!.hasIssues {
            doesIssueExist.text = "Yes"
        } else {
            doesIssueExist.text = "No"
        }
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
