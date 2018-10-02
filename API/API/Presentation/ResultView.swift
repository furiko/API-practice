//
//  ResultViewController.swift
//  API
//
//  Created by futa on 2018/10/02.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

protocol ResultView {
    func printResultDetail(_ repository: RepositoryModel)
    func errorHandler(_ error: Error)
}
