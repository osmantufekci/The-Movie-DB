//
//  MainViewModel.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation

final class MainViewModel {
    
    var reloadTableViewClosure: (() -> Void)!
    var updateLoadingStatus: (() -> Void)!
    var setTableViewBackGround: (() -> Void)!
    
    let group = DispatchGroup()
    
    var nowPlayingMovies = [Results]()
    var upcomingMovies = [Results]()
    var totalPages = 0
    var pageIndex = 0
    init(){}
    
    func fetchData(_ isLoadMore: Bool = false, pageIndex: Int = 1){
        self.isLoading = true
        group.enter()
        RequestManager.instance.getNowPlayingData(url: BaseUrl.nowPlaying, page: pageIndex) { status, result in
            
            guard status else {
                AlertMessageManager.instance.ShowErrorMessage("Hata", subTitle: "Bir hata meydana geldi")
                return
            }
            
            guard let movies = result.results else {
                AlertMessageManager.instance.ShowErrorMessage("Hata", subTitle: "Filmler alınamadı")
                return
            }
            
            self.nowPlayingMovies = movies
            
            self.group.leave()
        }
        group.enter()
        RequestManager.instance.getUpcomingData(url: BaseUrl.upcoming, page: pageIndex) { status, movie in
            guard status else {
                AlertMessageManager.instance.ShowErrorMessage("Hata", subTitle: "Bir hata meydana geldi")
                return
            }
            
            self.totalPages = movie?.total_pages ?? 0
            
            guard let movies = movie?.results else { return }
            if isLoadMore{
                self.upcomingMovies.append(contentsOf: movies)
            }else{
                self.upcomingMovies = movies
            }
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            self.reloadTableViewClosure()
            self.isLoading = false
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> Results {
        return upcomingMovies[indexPath.row]
    }
    
    func getCellViewModel(at indexPath: Int) -> Results {
        return upcomingMovies[indexPath]
    }
    
    func getNowPlayingCellModel() -> [Results] {
        return nowPlayingMovies
    }
    
    func getNowPlayingCellModel(at indexPath: Int) -> Results {
        return nowPlayingMovies[indexPath]
    }
    
    var numberOfSections: Int{
        return 1
    }
    
    var dataCount: Int{
        let totalDataCount = upcomingMovies.count
        return totalDataCount
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus()
        }
    }
    
    func didSelectSlider(at page: IndexPath) {
        
    }
    
}
