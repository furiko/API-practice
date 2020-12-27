//
//  RepositoryTranslator.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class RepositoryTranslator {
    static func translate(_ entity: RepositoryEntity) -> RepositoryModel {
        return RepositoryModel(
            id: entity.id,
            name: entity.name,
            createdAt: entity.createdAt,
            updatedAt: entity.updatedAt,
            forksCount: entity.forksCount,
            hasIssues: entity.hasIssues
        )
    }
}
