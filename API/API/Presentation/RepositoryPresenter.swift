//
//  RepositoryPresenter.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class RepositoryPresenter {
    
    let useCase: RepositoryUseCase
    let view: ResultView
    
    init(useCase: RepositoryUseCase = RepositoryUseCase(), view: ResultView) {
        self.useCase = useCase
        self.view = view
    }
    
    func printRepository(UserName userName: String, RepositoryName repositoryName: String) {
        useCase.getRepository(UserName: userName, RepositoryName: repositoryName, successAction: { repository in
            self.view.printResultDetail(repository)
        }) { error in
            self.view.errorHandler(error)
        }
    }
}
