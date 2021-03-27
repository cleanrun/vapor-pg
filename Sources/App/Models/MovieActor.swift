//
//  MovieActor.swift
//  
//
//  Created by cleanmac on 27/03/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class MovieActor: Model {
    static let schema = "movie_actors"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "movie_id")
    var movie: Movie
    
    @Parent(key: "actor_id")
    var actor: Actor
    
    init() { }
    
    init(movieId: UUID, actorId: UUID) {
        self.$movie.id = movieId
        self.$actor.id = actorId
    }
}
