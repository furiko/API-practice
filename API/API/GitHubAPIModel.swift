//
//  GHAPIModel.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import Himotoki

class GitHubAPIModel {  //GitHub API Model
    static var result: Repository?
    static var error: Error?

    static func get(UserName userName: String, RepositoryName repoName: String, successHandler: @escaping (Repository) -> Void, errorHandler: @escaping (Error?) -> Void) { //call GitHub API and decode response

        let url = "https://api.github.com/repos/\(userName)/\(repoName)"

        let myUrl: URL = URL(string: url)!
        let session = URLSession.shared.dataTask(with: myUrl){ data, response, error in
            print("session start")
            if let error = error {
                print("クライアントエラー: \(error.localizedDescription) \n" )
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("No Response")
                errorHandler(nil) //エラー作って入れる？
                return
            }
            
            guard let data = data else {
                print("No Response")
                errorHandler(nil) //エラー作って入れる？
                return
            }
            
            if response.statusCode == 200 {
                print("success")
                print(data)
            } else {
                print("url: \(url)")
                print("サーバーサイドエラー ステータスコード: \(response.statusCode)\n")
                errorHandler(nil)   //エラー作って入れる？
                return 
            }

            let result: Repository = parse(data)
            successHandler(result)
           
        }
        session.resume()
    }
    
    func parseJSON(_ data: Data) -> Repository {
        print("parse start")
        let repository = try! Repository.decodeValue(from: data)
        return repository
    }
    static func parse(_ data: Data) -> Repository {
        let repository = try! Repository.decodeValue(from: data)
        return repository
    }
    

    
    struct Repository: Himotoki.Decodable {
        let id: Int
        let name: String
        let createdAt: String
        let updatedAt: String
        let forksCount: Int
        let hasIssues: Bool
        let owner: Owner
        static func decode(_ e: Extractor) throws -> Repository {
            return try Repository (
                id: e <| "id",
                name: e <| "name",
                createdAt: e <| "created_at",
                updatedAt: e <| "updated_at",
                forksCount: e <| "forks_count",
                hasIssues: e <| "has_issues",
                owner: e <| "owner"
            )
        }
    }
    
    struct Owner: Himotoki.Decodable {
        let login: String
        let id: Int
        
        static func decode(_ e: Extractor) throws -> Owner {
            return try Owner (
                login: e <| "login",
                id: e <| "id"
            )
        }
    }
}
