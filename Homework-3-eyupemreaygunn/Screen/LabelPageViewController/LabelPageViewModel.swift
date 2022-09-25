//
//  LabelPageViewModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import Foundation

protocol LabelPageViewModelViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}
  class LabelPageViewModel {
    private let model = LabelPageModel()
    weak var viewDelegate: LabelPageViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
   
    func didViewLoad() {
        model.fetchData()
        
    }
    func didClickItem(at index: Int) {
        _ = model.posts[index]
        
    }
}
private extension LabelPageViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] {
        return posts.map { .init(title: $0.title, userId: $0.userId, id: $0.id, body: $0.body)
            
        }
    }
}
extension LabelPageViewModel: LabelPageModelProtocol {
    func didDataFetchProcessFinish(_ isSucess: Bool) {
        if isSucess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
            
        }
    }
}
