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
        
        let user = UserName.text!
        let repo = RepositryName.text!
        
        if user != "" && repo != "" {
            controller.callGitHubAPI(UserName: user, RepositoryName: repo)    //ModelにRepositoryの中身を取りに行ってもらう
            DispatchQueue.main.asyncAfter(deadline: .now()+1.0){    //1秒遅延してAPIから値が返ってくるのを待つ
                let storyboard: UIStoryboard = self.storyboard!
                let second = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                self.present(second, animated: true, completion: nil)
            }

        } else {
            print("title blank")
            let alert: UIAlertController = UIAlertController(title: "必要事項を全て入力してください", message: "ユーザ名またはレポジトリ名が入力されていません", preferredStyle: .alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
                print("OK")})
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

