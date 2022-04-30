//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    let viewModel: MainViewModel = MainViewModel()
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var listView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var pageIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewBackground(for: listView)
        updateLoadingStatus(for: listView)
        reloadTableView(for: listView)
        
        addRefreshControl()
        
        listView.registerCell(cell: NowPlayingCell.self)
        listView.registerCell(cell: UpComingCell.self)
        
        listView.delegate = self
        listView.dataSource = self
        
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addRefreshControl(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        listView.addSubview(refreshControl)
    }
    
    @objc
    func refresh(_ sender: AnyObject) {
        viewModel.fetchData()
    }
    
    //MARK: Bindings
    func setTableViewBackground(for tableView: UITableView){
        viewModel.setTableViewBackGround = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if self.viewModel.dataCount > 0 {
                    tableView.backgroundView = nil
                }else {
                    let emptyLabel: UILabel = {
                        let emptyLabel = UILabel(frame: tableView.bounds)
                        emptyLabel.textAlignment = .center
                        emptyLabel.textColor = .black
                        emptyLabel.text = "Görüntülenecek kayıt bulunamadı."
                        return emptyLabel
                    }()
                    
                    tableView.backgroundView = emptyLabel
                }
            }
        }
    }
    
    private func updateLoadingStatus(for tableView: UITableView){
        viewModel.updateLoadingStatus = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let isLoading = self.viewModel.isLoading
                if isLoading {
                    self.activityIndicator.startAnimating()
                    tableView.isUserInteractionEnabled = false
                    self.activityIndicator.alpha = 1.0
                } else {
                    self.activityIndicator.stopAnimating()
                    tableView.isUserInteractionEnabled = true
                    self.activityIndicator.alpha = 0.0
                    AlertMessageManager.instance.closeAlertView()
                }
            }
        }
    }
    
    private func reloadTableView(for tableView: UITableView){
        viewModel.reloadTableViewClosure = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                tableView.reloadData()
            }
        }
    }

}

extension MainViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC: DetailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        if indexPath.row == 0 {
            let cell = tableView.cellForRow(at: indexPath) as! NowPlayingCell
            let model = viewModel.getNowPlayingCellModel(at: cell.currentIndex)
            detailVC.viewModel = DetailViewModel(data: model)
            detailVC.detailImage = cell.getCellImage()
        }else {
            let model = viewModel.getCellViewModel(at: indexPath)
            detailVC.viewModel = DetailViewModel(data: model)
            let cell = tableView.cellForRow(at: indexPath) as! UpComingCell
            detailVC.detailImage = cell.getCellImage()
        }
        
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.cellWithIdentifierAndIndexPath(cell: NowPlayingCell.self, indexPath: indexPath)
            let data = viewModel.getNowPlayingCellModel()
            cell.viewModel = NowPlayingCellViewModel(data: data)
            return cell
        }
           
        let cell = tableView.cellWithIdentifierAndIndexPath(cell: UpComingCell.self, indexPath: indexPath)
        let data = viewModel.getCellViewModel(at: indexPath)
        cell.viewModel = UpcomingCellModel(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = viewModel.dataCount-1
        let totalPages = viewModel.totalPages
        
        if indexPath.row == lastIndex, pageIndex <= totalPages {
            pageIndex += 1
            viewModel.fetchData(true, pageIndex: pageIndex)
        }
    }
}
