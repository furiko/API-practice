//
//  ResultViewController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import UIKit

class oldResultViewController: UIViewController {
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var createDate: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    @IBOutlet weak var numOfFork: UILabel!
    @IBOutlet weak var doesIssueExist: UILabel!
    var result: GitHubAPIModel.Repository!
    override func viewDidLoad() {
        super.viewDidLoad()
        setResult()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   func setResult() {   //set to TextField
        result = GitHubAPIModel.result!
        repoName.text = result.name
    
        //convert from ISO8601 to Date and formatting
        let formatter = ISO8601DateFormatter.init()
        let createdDate = formatter.date(from: result.createdAt)
        let updatedDate = formatter.date(from: result.updatedAt)
        let f = DateFormatter()
        f.timeStyle = .medium
        f.dateStyle = .medium
        f.locale = Locale(identifier: "ja_JP")
    
        createDate.text = f.string(from: createdDate!)
        updateDate.text = f.string(from: updatedDate!)
        numOfFork.text = String(result.forksCount)

        print("owner id: \(result.owner.id)")
        print("owner login: \(result.owner.login)")
    
        if result!.hasIssues {
            doesIssueExist.text = "Yes"
        } else {
            doesIssueExist.text = "No"
        }
    }
 
}
