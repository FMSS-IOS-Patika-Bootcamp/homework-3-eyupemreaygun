//
//  LabelPageModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import Foundation
protocol LabelPageModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSucess: Bool)
}

class LabelPageModel {
    weak var delegate: LabelPageModelProtocol?
    var posts: [Post] = []
    
    func fetchData() {
        guard let url = URL.init(string:"https://jsonplaceholder.typicode.com/posts") else {
            delegate?.didDataFetchProcessFinish(false)
                    return
                }
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            guard error == nil
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            guard
                  statusCode >= 200,
                  statusCode < 300
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            guard let data = data else {
            self.delegate?.didDataFetchProcessFinish(false)
            return

        }
            do {
                let jsonDecoder = JSONDecoder()
                self.posts = try jsonDecoder.decode([Post].self, from: data)
                self.delegate?.didDataFetchProcessFinish(true)
                
            } catch {
                self.delegate?.didDataFetchProcessFinish(false)
            }
    }
        task.resume()
        
    }
}
