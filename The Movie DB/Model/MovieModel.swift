//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit

func == (lhs: Results, rhs: Results) -> Bool {
    if lhs.id == rhs.id {
        return true
    }
    return false
}

struct MovieModel: Codable {
    let page: Int?
    var results: [Results]?
    let total_pages: Int?
    let total_results: Int?
}

struct Results: Codable, Equatable {
    let iso_639_1: String?
    let iso_3166_1: String?
    let name: String?
    let key: String?
    let published_at: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let genre_ids: [Int]?
    let adult: Bool?
    let backdrop_path: String?
    let id: Int?
    let original_title: String?
    let vote_average: Double?
    let popularity: Double?
    let poster_path: String?
    let overview: String?
    let title: String?
    let original_language: String?
    let vote_count: Int?
    let release_date: String?
    let video: Bool?
    var isFaved: Bool? = false
}

