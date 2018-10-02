//
//  ViewController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import UIKit

class OldViewController: UIViewController {
    var result: GitHubAPIModel.Repository?
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var RepositryName: UITextField!
    
    @IBAction func tapSearchButton() {
        
        let user = UserName.text!
        let repository = RepositryName.text!
        
        if user != "" && repository != "" {
            GitHubAPIModel.get(UserName: user, RepositoryName: repository, successHandler: { repository in
                GitHubAPIModel.result = repository
                print("stored result in GitHubAPIModel.result")
                
               /* DispatchQueue.main.async{
                    print("mainスレッドでstoryboard作成")
                    let storyboard: UIStoryboard = self.storyboard!
                    let next = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                    self.present(next, animated: true, completion: nil)
                }*/
                
            }, errorHandler: { error in
                print("Error: \(String(describing: error))")
                DispatchQueue.main.async {
                    let alert: UIAlertController = UIAlertController(title: "レポジトリが見つかりませんでした", message: error as? String, preferredStyle: .alert)
                    let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
                        print("printed alert")})
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                }
            })
            
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

