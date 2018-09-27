//
//  GHAPIModel.swift
//  API
//
//  Created by futa on 2018/09/27.
//  Copyright © 2018年 furiko. All rights reserved.
//

import Foundation

class GHAPIModel {  //GitHub API Model
    var result: Repository?
    func get(UserName uName: String, RepositoryName rName: String) {
        var url = "https://api.github.com/repos/"
        url += uName + "/" + rName

        let myUrl: URL = URL(string: url)!
        let session = URLSession.shared.dataTask(with: myUrl){ data, response, error in
            
            if let error = error {
                print("クライアントエラー: \(error.localizedDescription) \n" )
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                print("No Data or No Response")
                return
            }
            
            if response.statusCode == 200 {
                print("success")
                print(data)
                self.parseJSON(data)
            } else {
                print("url: \(url)")
                print("サーバーサイドエラー ステータスコード: \(response.statusCode)\n")
            }
        }
        session.resume()
   //     return data2!
    }
    
    func parseJSON(_ data: Data?) {
        guard let data = data else {
            print("Error: No data to decode")
            return
        }
        
        guard let repo = try? JSONDecoder().decode(Repository.self, from: data) else {
            print("Error: Couldn't decode to Repository")
            return
        }
        
        print(repo)
        self.result = repo
        /*print("id: \(repo.id)")
        print("name: \(repo.name)")
        print("full_name: \(repo.fullName)")*/
//        print("owner: \(repo.owner)")
    }
    
    func getResult() -> Repository {
        return result!
    }
    
    /*
     repositoryで知りたい情報
     名前
     オーナー
     
     */
    
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
    

    /*
    struct Owner: Decodable {
        let login: String
        let id: Int
        let nodeId: String
        let avatarUrl: String
        let gravatarId: String
        
        enum CodingKeys: String, CodingKey {
            case login
            case id
            case nodeId = "node_id"
            case avatarURl = "avatar_url"
            case gravatarId = "gravatar_id"
        }
    }*/
}
