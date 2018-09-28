//
//  GHAPIModel.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation
import Himotoki

class GHAPIModel {  //GitHub API Model
    static var result: Repository?

    static func get(UserName uName: String, RepositoryName rName: String) { //call GitHub API and decode response

        var url = "https://api.github.com/repos/"
        url += uName + "/" + rName

        let myUrl: URL = URL(string: url)!
        let session = URLSession.shared.dataTask(with: myUrl){ data, response, error in
            
            if let error = error {
                print("クライアントエラー: \(error.localizedDescription) \n" )
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("No Response")
                return
            }
            
            guard let data = data else {
                print("No Response")
                return
            }
            
            if response.statusCode == 200 {
                print("success")
                print(data)
            } else {
                print("url: \(url)")
                print("サーバーサイドエラー ステータスコード: \(response.statusCode)\n")
            }
            self.parseJSON(data)  //decode
        }
        session.resume()
    }
    
    
    static func parseJSON(_ data: Data) {
        print("parse start")
        let repo = try? Repository.decodeValue(from: data)
        result = repo
    }
    
    struct Repository: Himotoki.Decodable {
        let id: Int
        let name: String
        let createdAt: String
        let updatedAt: String
        let forksCount: Int
        let hasIssues: Bool
//        let owner: String
        static func decode(_ e: Extractor) throws -> Repository {
            return try Repository (
                id: e <| "id",
                name: e <| "name",
                createdAt: e <| "created_at",
                updatedAt: e <| "updated_at",
                forksCount: e <| "forks_count",
                hasIssues: e <| "has_issues"
/*                owner: e <| ["login", "avatar_url"]*/
            )
        }
    }
    /*    func parseJSON(_ data: Data?) {
        guard let data = data else {
            print("Error: No data to decode")
            return
        }
        
        guard let repo = try? JSONDecoder().decode(Repository.self, from: data) else {
            print("Error: Couldn't decode to Repository")
            return
        }
        
        print(repo)
    }
    */


    /*
    struct Owner: Decodable {
        let login: String
        let id: Int
        let nodeId: String
        /*let avatarUrl: String
         let gravatarId: String
         let Private: Bool
         let collaboratorsUrl: String*/
        enum Codingkeys: String, CodingKey {
            case login
            case id
            case nodeId = "node_id"
            /*case avatarUrl = "avatar_url"
             case gravatarId = "gravatar_id"
             case Private = "private"
             case collaboratorsUrl = "collaborators_url"*/
        }
    }
 */
    

    /*
    struct Repository: Decodable {
        let id: Int
        let nodeId: String
        let name: String
        let fullName: String
//        let owner: Owner
        
        let createdAt: String
        let updatedAt: String
        let pushedAt: String

        let forksCount: Int
        let hasIssues: Bool
        let openIssuesCount: Int
        
        let collaboratorsUrl: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case nodeId = "node_id"
            case name
            case fullName = "full_name"
//            case owner
            
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case pushedAt = "pushed_at"
        
            case forksCount = "forks_count"
            case hasIssues = "has_issues"
            case openIssuesCount = "open_issues_count"
        
            case collaboratorsUrl = "collaborators_url"
        }
    }
 */
    


}
