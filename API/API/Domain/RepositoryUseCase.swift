//
//  RepositoryUseCase.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class RepositoryUseCase {
    func getRepository(UserName userName: String, RepositoryName repositoryName: String, successAction: @escaping (_ model:RepositoryModel) -> Void, errorAction: @escaping (Error) -> Void) {
        API.get(UserName: userName, RepositoryName: repositoryName, successHandler: { entity in
            successAction(RepositoryTranslator.translate(entity))
        }, errorHandler: { error in
            errorAction(error)
        })
    }
}
