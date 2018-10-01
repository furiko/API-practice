//
//  RepositoryModel.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

struct RepositoryModel {
    let id: Int
    let name: String
    let createdAt: String
    let updatedAt: String
    let forksCount: Int
    let hasIssues: Bool
    
    func toString() -> String {
        return "id: \(id), name: \(name), createdAt: \(createdAt), updatedAt: \(updatedAt), forksCount: \(forksCount), hasIssues: \(hasIssues)"
    }
}
