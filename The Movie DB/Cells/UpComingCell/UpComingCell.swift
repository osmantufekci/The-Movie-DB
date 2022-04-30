//
//  UpComingCell.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit
import SDWebImage

final class UpComingCell: BaseCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    var viewModel: UpcomingCellModel! {
        didSet{
            setCellImage()
            setCellTitleText()
            setCellDetailText()
            setCellDateText()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        movieImage.contentMode = .redraw
        
    }
    
    func setCellImage(){
        movieImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let posterPath = viewModel.data.backdrop_path ?? ""
        let url = BaseUrl.getImageMovieURL(posterPath)
        movieImage.sd_setImage(with: url)
    }
    
    func getCellImage() -> UIImage? {
        return movieImage.image
    }
    
    func setCellTitleText(){
        self.title.text = viewModel.getMovieTitle()
    }
    
    func setCellDetailText(){
        self.overview.text = viewModel.getMovieExplanation()
    }
    
    func setCellDateText(){
        self.releaseDate.text = viewModel.getReleaseDate()
    }
    
}




