//
//  NetworkingModel.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 28.10.22.
//

import Foundation

// MARK: - RnM
class NetworkingModel: Codable {
    let info: Info?
    var results: [Result]?

    init(info: Info?, results: [Result]?) {
        self.info = info
        self.results = results
    }
}

// MARK: - Info
class Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?

    init(count: Int?, pages: Int?, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

// MARK: - Result
class Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?

    init(id: Int?, name: String?, status: String?, species: String?, type: String?, gender: String?, origin: Location?, location: Location?, image: String?, episode: [String]?, url: String?, created: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}


// MARK: - Location
class Location: Codable {
    let name: String?
    let url: String?

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


