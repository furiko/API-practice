//
//  ViewController.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlet
    
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var RepositoryName: UITextField!
    
    //MARK: -Property
    
    var presenter: RepositoryPresenter!
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RepositoryPresenter(view: self)
    }

    //MARK: -Action
    
    @IBAction func tapSearchButton(_ sender: Any) {

        presenter.printRepository(UserName: UserName.text!, RepositoryName: RepositoryName.text!)
    }
    
}

extension ViewController: ResultView {
    func printResultDetail(_ repository: RepositoryModel) {
        
        let storyboard: UIStoryboard = self.storyboard!
        let next: ResultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        present(next, animated: true, completion: {//遷移

            next.repoName.text = repository.name
            
            next.forksCounts.text = String(repository.forksCount)

            //convert from ISO8601 to Date and formatting
            let formatter = ISO8601DateFormatter.init()
            let createdDate = formatter.date(from: repository.createdAt)
            let updatedDate = formatter.date(from: repository.updatedAt)
            let f = DateFormatter()
            f.timeStyle = .medium
            f.dateStyle = .medium
            f.locale = Locale(identifier: "ja_JP")
            
            next.createdAt.text = f.string(from: createdDate!)
            next.updatedAt.text = f.string(from: updatedDate!)
            
            if repository.hasIssues {
                next.repoHasIssues.text = "Yes"
            } else {
                next.repoHasIssues.text = "No"
            }
        })
        
    }
    
    func errorHandler(_ error: Error) {
        let alert: UIAlertController = UIAlertController(title: "レポジトリが見つかりませんでした", message: error as? String, preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
            print("printed alert")})
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
}
