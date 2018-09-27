//
//  ViewGHAPIController.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class ViewGHAPIController {
    let model = GHAPIModel()
    func getRepoData(UserName uName: String, RepositoryName rName: String) {
        /*let data: Data =*/
        model.get(UserName: uName, RepositoryName: rName)
    }
    
    func getResult() -> GHAPIModel.Repository {
        return model.getResult()
    }
}
