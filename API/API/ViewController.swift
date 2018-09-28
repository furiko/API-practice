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
        print("get前")
        controller.getRepoData(UserName: user, RepositoryName: repo)
        print("after get")
//        result = controller.getResult()
//        print("after catch result")
        print("get前")
//        result = controller.getResult()
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
            let storyboard: UIStoryboard = self.storyboard!
            let second = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
//            self.performSegue(withIdentifier: "toResultViewController", sender: nil)
//            let next = ResultViewController()
            second.result = self.controller.getResult()
            self.present(second, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let user = "furiko"
        let repo = "practiceTodo"
        print("get前")
        controller.getRepoData(UserName: user, RepositoryName: repo)
        print("after get")
 */

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "toResultViewController" {
            let next: ResultViewController = (segue.destination as? ResultViewController)!

                            self.result = self.controller.getResult()
                print("result:\(self.result)")
                next.result = self.result
            
///            result = controller.getResult()

        }
    }


}

