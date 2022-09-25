//
//  ImagePageViewModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 22.09.2022.
//

import Foundation

protocol ImagePageViewModelViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items2: [PhotosCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}
class ImagePageViewModel {
  private let model = ImagePageModel()
  weak var viewDelegate: ImagePageViewModelViewProtocol?
  
  init() {
      model.delegate = self
  }
 
  func didViewLoad() {
      model.fetchData()
      
  }
  func didClickItem(at index: Int) {
      _ = model.photos[index]
      
  }
}
private extension ImagePageViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photos]) -> [PhotosCellViewModel] {
        
        return photos.map { .init(url: $0.url, thumbnailUrl: $0.thumbnailUrl, title: $0.title)
            
           
        }
            
        }
    }
extension ImagePageViewModel: ImagePageModelProtocol {
    func didDataFetchProcessFinish(_ isSucess: Bool) {
        if isSucess {
            let photos = model.photos
            let cellModels = makeViewBasedModel(photos)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
            
        }
    }
}

