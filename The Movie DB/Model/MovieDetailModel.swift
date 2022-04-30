//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation

struct MovieDetailModel: Decodable, Encodable{
    let adult: Bool?
    let backdrop_path: String?
    let belongs_to_collection: BelongsToCollection?
    let budget: Int?
    let genres: [Genres]?
    let id: Int?
    let imdb_id: String?
    let homepage: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let production_companies: [ProductionCompanies]?
    let production_countries: [ProductionCountries]?
    let release_date: String?
    let revenue: Int?
    let runtime: Int?
    let spoken_languages: [SpokenLanguages]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
    var isFaved: Bool? = false
}

struct Genres: Decodable, Encodable {
    let id: Int?
    let name: String?
}

struct SpokenLanguages: Decodable, Encodable {
    let english_name: String?
    let iso_639_1: String?
    let name: String?
}

struct ProductionCompanies: Decodable, Encodable {
    let id: Int?
    let logo_path: String?
    let name: String?
    let origin_country: String?
}

struct ProductionCountries: Decodable, Encodable {
    let iso_3166_1: String?
    let name: String?
}

struct BelongsToCollection: Decodable, Encodable {
    let backdrop_path: String?
    let id: Int?
    let poster_path: String?
    let name: String?
}
