//
//  ViewGHAPIController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import Himotoki
class ViewGitHubAPIController {
    func callGitHubAPI(UserName userName: String, RepositoryName repoName: String) /*-> GHAPIModel.Repository*/{
        GitHubAPIModel.get(UserName: userName, RepositoryName: repoName, successHandler: {
            repository in
            GitHubAPIModel.result = repository
            print("stored result in GitHubAPIModel.result")
        }, errorHandler: { error in
            print("Error: \(error)")
        })
    }
    
    func getResult() -> GitHubAPIModel.Repository {
        return GitHubAPIModel.result!
    }
}
