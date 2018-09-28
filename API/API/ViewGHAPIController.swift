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
    let model = GHAPIModel()
    var result: GHAPIModel.Repository?
    func getRepoData(UserName uName: String, RepositoryName rName: String) /*-> GHAPIModel.Repository*/{
        /*let data: Data =*/
        model.get(UserName: uName, RepositoryName: rName, completion: {(data: Data) -> Void in
            self.result = self.model.parseJSON(data)
        })
      // return result!
    }
    
    func getResult() -> GHAPIModel.Repository {
        print("controller get前")
        return result!
    }
}
