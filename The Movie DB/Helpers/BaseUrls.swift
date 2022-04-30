//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation

struct BaseUrl {
    
    static let searchMovies = "api.themoviedb.org/3/search/movie"
    static let getMovieDetails = "api.themoviedb.org/3/movie/"
    static let movieImage = "image.tmdb.org/t/p/original"
    static let youtubeUrl = "www.youtube.com/watch?v="
    static let popularMovies = "https://api.themoviedb.org/3/movie/popular"
    static let getVideos = "https://api.themoviedb.org/3/movie/4951/videos?api_key=e3e3629955e6c2f038f7663e474c440e"
    static let signUpUrl = "https://www.themoviedb.org/signup"
    static let nowPlayingUrl = "/movie/now_playing"
    static let upcomingUrl = "/movie/upcoming"
    static let api = "?api_key="
    
    static let rootUrl = "https://api.themoviedb.org/3"
    
    static let nowPlaying = rootUrl + nowPlayingUrl + api + UserDefaultManager.ApiKey
    static let upcoming = rootUrl + upcomingUrl + api + UserDefaultManager.ApiKey
    
    static func getImageMovieURL(_ poster: String) -> URL {
        var str = movieImage + poster
        str = str.replacingOccurrences(of: "//", with: "/")
        str = "https://" + str
        return URL(string: str)!
    }
    
    
    static func getVideoURL(for id: Int) -> String? {
        let str = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=e3e3629955e6c2f038f7663e474c440e"
        
        return id != 0 ? str : nil
    }
    
    static func detailsURL(_ id: String, _ language: String) -> String {
        let apiKey = UserDefaultManager.ApiKey
        var str = getMovieDetails + id + "?api_key=" + apiKey + "&language=" + language
        str = str.replacingOccurrences(of: "//", with: "")
        str = "https://" + str
        return str
    }
    
    static func searchUrl(_ language: String, text query: String, isAdult: Bool? = nil, _ page: Int? = nil) -> String {
        let apiKey = UserDefaultManager.ApiKey
        var str = searchMovies + "?api_key=" + apiKey + "&language="
        str += language + "&query="
        str += query + "&page=" + "\(page ?? 1)"
        str += "&include_adult=" + "\(isAdult ?? false)"
        str = str.replacingOccurrences(of: "//", with: "")
        str = "https://" + str
        return str
    }
}

struct Headers {
    static func getHeaders() -> [String:String] {
        
        let headers = [
            "Authorization": "Bearer " + UserDefaultManager.LoginUserToken,
            "Content-Type" : "application/json;charset=utf-8"
        ]
        
        return headers
    }
}

struct Parameters {
    static func getParameters(_ page: Int? = nil) -> [String:AnyObject] {
        
        let parameters = [
            "api_key" : UserDefaultManager.ApiKey as AnyObject,
            "language": "" as AnyObject,
            "page"    : page as AnyObject
        ]
        
        return parameters
    }
}
