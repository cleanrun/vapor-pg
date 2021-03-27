//
//  Review.swift
//  
//
//  Created by cleanmac on 27/03/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Review: Model, Content {
     
    static let schema = "reviews"
    
    @ID(key: .id) // Primary key
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "body")
    var body: String
    
    @Parent(key: "movie_id") // Foreign Key
    var movie: Movie
    
    init() { }
    
    init(id: UUID? = nil, title: String, body: String, movieID: UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$movie.id = movieID
    }
}
