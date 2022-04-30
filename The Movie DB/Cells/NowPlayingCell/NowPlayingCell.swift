//
//  NowPlayingCell.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit
import SDWebImage
import ImageSlideshow

final class NowPlayingCell: BaseCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var detail: UILabel!
    
    var currentIndex = 0
    
    var viewModel: NowPlayingCellViewModel! {
        didSet{
            viewModel.setImageSliderData()
            imageSlider.setImageInputs(viewModel.sliderImages)
            setCellTitleText(at: currentIndex)
            setCellDetailText(at: currentIndex)
        }
    }
    
    @IBOutlet var imageSlider: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        configureSlider()
    }
    
    func configureSlider(){
        imageSlider.slideshowInterval = 3.0
        imageSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 5))
        imageSlider.activityIndicator = DefaultActivityIndicator()
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.white
        pageIndicator.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.5)
        imageSlider.pageIndicator = pageIndicator
        imageSlider.slideshowInterval = 5
        imageSlider.delegate = self
        imageSlider.pageIndicator?.numberOfPages = 5
        imageSlider.backgroundColor = .clear
        imageSlider.draggingEnabled = true
    }
    
    func setCellTitleText(at index: Int){
        self.title.text = viewModel.getMovieTitleForNowPlaying(at: index)
    }
    
    func setCellDetailText(at index: Int){
        self.detail.text = viewModel.getMovieExplanationForNowPlaying(at: index)
    }
    
    func getCellImage() -> UIImage? {
        return imageSlider.currentSlideshowItem?.imageView.image
    }
    
}

extension NowPlayingCell: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        var index = 0
        if page == viewModel.datas.count-1 {
            imageSlider.setCurrentPage(0, animated: true)
        }
        index = page
        self.currentIndex = index
        setCellTitleText(at: index)
        setCellDetailText(at: index)
    }
    

}
