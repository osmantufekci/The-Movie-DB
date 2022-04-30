//
//  NowPlayingCellModel.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit
import ImageSlideshow

final class NowPlayingCellViewModel: BaseCellViewModel {
    
    var index: Int!
    var sliderImages: [SDWebImageSource] = [SDWebImageSource]()
    
    var nowPlayingData: [Results]!
    
    override init(data: [Results]) {
        super.init(data: data)
        self.nowPlayingData = data
        setImageSliderData()
    }
    
    func setImageSliderData(){
        guard let datas = nowPlayingData else { return }
        
        for data in datas {
            guard let posterPath = data.poster_path else { continue }
            let posterUrl = BaseUrl.getImageMovieURL(posterPath)
            let sliderImage = SDWebImageSource(url: posterUrl)
            sliderImages.append(sliderImage)
        }
    }
    
}
