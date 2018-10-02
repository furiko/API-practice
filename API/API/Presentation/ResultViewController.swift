//
//  ResultViewController.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var updatedAt: UILabel!
    @IBOutlet weak var repoHasIssues: UILabel!
    @IBOutlet weak var forksCounts: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
