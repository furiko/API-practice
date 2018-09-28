//
//  ViewGHAPIController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import Himotoki
class ViewGHAPIController {
    func callGitHubAPI(UserName uName: String, RepositoryName rName: String) /*-> GHAPIModel.Repository*/{
        GHAPIModel.get(UserName: uName, RepositoryName: rName)
    }
    
    func getResult() -> GHAPIModel.Repository {
        return GHAPIModel.result!
    }
}
