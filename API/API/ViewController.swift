//
//  ViewController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let controller = ViewGHAPIController()
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var RepositryName: UITextField!
    @IBAction func tapSearchButton() {
        let user = "furiko"
        let repo = "practiceTodo"
        controller.getRepoData(UserName: user, RepositoryName: repo)
//        performSegue(withIdentifier: "toResultViewController", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "toResultViewController" {
            
        }
    }
*/

}

