//
//  DetailViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 28.03.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    var detailImage: UIImage?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureScrollView()
        setTitle(for: movieTitle)
        setOverviewText(for: movieOverview)
        setReleaseDate()
        setImage()
        movieImage.contentMode = .redraw
        self.title = viewModel.getTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func configureScrollView(){
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = self.view.frame.size
//        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    func setTitle(for label: UILabel){
        label.text = viewModel.getTitle()
    }
    
    func setOverviewText(for label: UILabel){
        label.text = viewModel.getOverview()
    }
    
    func setImage(){
        self.movieImage.image = detailImage
    }
    
    func setVoteAverage(){
        self.voteAverage.text = viewModel.getVoteAverage()
    }
    
    func setReleaseDate(){
        self.releaseDate.text = viewModel.getReleaseDate()
    }
    
    
}
