//
//  BaseCellModel.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation
import UIKit

class BaseCellViewModel {
    
    var data: Results!
    var datas: [Results]!
    
    init(data: Results) {
        self.data = data
    }
    
    init(data: [Results]) {
        self.datas = data
    }
    
    func getMovieTitle() -> String {
        guard let title = data.title else { return "" }
        return title
    }
    
    func getMovieExplanationForNowPlaying(at row: Int) -> String {
        guard let overview = datas[row].overview else { return "" }
        return overview
    }
    
    func getReleaseDateForNowPlaying(at row: Int) -> String {
        guard let date = datas[row].release_date else { return "" }
        return date
    }
    
    func getMovieTitleForNowPlaying(at row: Int) -> String {
        guard let title = datas[row].title else { return "" }
        return title
    }
    
    func getMovieExplanation() -> String {
        guard let overview = data.overview else { return ""}
        return overview
    }
    
    func getReleaseDate() -> String {
        guard let date = data.release_date else { return "" }
        return date.turkishFormat()
    }
}
