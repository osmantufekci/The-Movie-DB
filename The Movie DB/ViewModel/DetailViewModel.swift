//
//  DetailViewModel.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit

final class DetailViewModel {
    
    var data: Results! = nil
    
    init(data: Results) {
        self.data = data
    }
    
    func getTitle() -> String {
        return data.title ?? ""
    }
    
    func getOverview() -> String {
        return data.overview ?? ""
    }
    
    func getVoteAverage() -> String {
        guard let average = data.vote_average else { return "?" }
        return String(average) + "/10"
    }
    
    func getReleaseDate() -> String {
        guard let date = data.release_date else { return "" }
        return date.turkishFormat()
    }
    
}
