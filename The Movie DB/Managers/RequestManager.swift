//
//  Enumeration.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation
import Alamofire

var requestManager: RequestManager?

final class RequestManager: NSObject {
    
    class var instance: RequestManager{
        
        if requestManager == nil {
            requestManager = RequestManager()
        }
        return requestManager!
    }
    
    func getDetailData(url requestUrl: String, page pageIndex: Int? = 1 ,completionHandler: @escaping (_ status: Bool, _ result: MovieDetailModel) -> ()) {
        var status = false
        var movieDetail: MovieDetailModel?
        
        if AlertMessageManager.instance.alertView.view.alpha == 0 {
            AlertMessageManager.instance.ShowWaitingMessage("Yükleniyor", subTitle: "Lütfen bekleyin")
        }
        
        AF.request(requestUrl, method: .get, encoding: URLEncoding.default)
            .responseDecodable(of: MovieDetailModel.self) { response in
                
                if let error = response.error {
                    status = response.error != nil
                    print(error.localizedDescription)
                    return
                }
                
                do {
                    movieDetail = try response.result.get()
                    status = movieDetail != nil
                } catch {
                    status = movieDetail != nil
                }
                
                completionHandler(status, movieDetail!)
            }
    }
    
    
    func getUpcomingData(url requestUrl: String, page pageIndex: Int? = 1 ,completionHandler: @escaping (_ status: Bool, _ result: MovieModel?) -> ()) {
        
        var status = false
        var movies: MovieModel?
        
        AlertMessageManager.instance.ShowWaitingMessage("Yükleniyor", subTitle: "Lütfen bekleyin")
        
        AF.request(requestUrl, method: .get, encoding: URLEncoding.default)
            .responseDecodable(of: MovieModel.self) { response in
                
                if let error = response.error {
                    status = response.error != nil
                    print(error.localizedDescription)
                    return
                }
                
                do {
                    movies = try response.result.get()
                    status = movies != nil
                } catch {
                    status = movies != nil
                }
                
                completionHandler(status, movies)
                
                AlertMessageManager.instance.closeAlertView()
            }
    }
        
    
    func getNowPlayingData(url requestUrl: String, page pageIndex: Int? = 1, completionHandler: @escaping (_ status: Bool, _ result: MovieModel) -> ()) {
        
        var status = false
        var movies: MovieModel?
        
        AlertMessageManager.instance.ShowWaitingMessage("Yükleniyor", subTitle: "Lütfen bekleyin")
        
        AF.request(requestUrl, method: .get, encoding: URLEncoding.default).responseJSON { response in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    movies = try decoder.decode(MovieModel.self, from: data)
                    status = true
                    
                    completionHandler(status, movies!)
                        }catch {
                            AlertMessageManager.instance.ShowErrorMessage("Hata", subTitle: "Film Listesi Çekilemedi")
                        }
            }else{
                if let err = response.error {
                    AlertMessageManager.instance.ShowWarningMessage("Hata", subTitle: err.localizedDescription)
                }
            }
        }
    }
}
