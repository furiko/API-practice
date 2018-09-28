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
    var result: GHAPIModel.Repository?
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var RepositryName: UITextField!
    @IBAction func tapSearchButton() {
        let user = "furiko"
        let repo = "practiceTodo"
        //let user = UserName.text
        //let repo = RepositryName.text
        controller.callGitHubAPI(UserName: user, RepositoryName: repo)    //ModelにRepositoryの中身を取りに行ってもらう
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0){    //1秒遅延してAPIから値が返ってくるのを待つ
            let storyboard: UIStoryboard = self.storyboard!
            let second = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
//            second.result = self.controller.getResult()
            self.present(second, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "toResultViewController" {
            let next: ResultViewController = (segue.destination as? ResultViewController)!

                            self.result = self.controller.getResult()
                print("result:\(self.result)")
                next.result = self.result
            
///            result = controller.getResult()

        }
    }*/

}

