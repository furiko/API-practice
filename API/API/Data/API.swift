//
//  API.swift
//  API
//
//  Created by futa on 2018/10/01.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    static func get(UserName userName: String, RepositoryName repositoryName: String,  successHandler: @escaping (_ repositoryEntity: RepositoryEntity) -> Void, errorHandler:  @escaping (Error) -> Void) {
        Alamofire.request(AppConstant.api.createUrl(UserName: userName, RepositoryName: repositoryName)).validate().responseJSON() { response in

            switch(response.result) {
                
            case .failure(let error):
                print(error)
                errorHandler(error)
            case .success(let data):
                let json = JSON(data)
                
                let id: Int = json["id"].intValue
                let name: String = json["name"].stringValue
                let createdAt: String = json["created_at"].stringValue
                let updatedAt: String = json["updated_at"].stringValue
                let forksCount: Int = json["forks_count"].intValue
                let hasIssues: Bool = json["has_issues"].boolValue
                let repositoryEtntity = RepositoryEntity(id: id, name: name, createdAt: createdAt, updatedAt: updatedAt, forksCount: forksCount, hasIssues: hasIssues)

                successHandler(repositoryEtntity)
            }
            
        }
        
    }
}
