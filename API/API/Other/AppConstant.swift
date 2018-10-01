//
//  AppConstant.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class AppConstant {
    struct api {
        static let url = "https://api.github.com/repos/"
        static func createUrl(UserName userName: String, RepositoryName repositoryName: String) -> String {
            return url + "\(userName)/\(repositoryName)"
        }
    }
}
