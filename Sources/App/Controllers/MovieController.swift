//
//  MovieController.swift
//
//
//  Created by cleanmac on 27/03/21.
//

import Fluent
import Vapor

final class MovieController {
    
    // MARK: - CRUD Operations
    private func create(_ req: Request) throws -> EventLoopFuture<Movie> {
        let movie = try req.content.decode(Movie.self)
        return movie.create(on: req.db).map { movie }
    }
    
    private func all(_ req: Request) throws -> EventLoopFuture<[Movie]> {
        Movie.query(on: req.db).all()
    }
    
    private func delete(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Movie.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound)).flatMap {
            $0.delete(on: req.db)
        }.transform(to: .ok)
    }
    
    // MARK: Configuration
    func configure(with app: Application) {
        app.post("movies", use: create)
        app.get("movies", use: all)
        app.delete("movies", ":id", use: delete)
    }
}
