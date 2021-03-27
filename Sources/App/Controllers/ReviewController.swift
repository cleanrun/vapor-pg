//
//  ReviewController.swift
//  
//
//  Created by cleanmac on 27/03/21.
//

import Fluent
import Vapor

final class ReviewController {
    
    // MARK: - CRUD Operations
    private func create(_ req: Request) throws -> EventLoopFuture<Review> {
        let review = try req.content.decode(Review.self)
        return review.save(on: req.db).map{ review }
    }
    
    private func findByMovieID(_ req: Request) throws -> EventLoopFuture<[Review]> {
        guard let movieId = req.parameters.get("movieId", as: UUID.self) else { throw Abort(.badRequest) }
        return Review.query(on: req.db).filter(\.$movie.$id, .equal, movieId).with(\.$movie).all()
    }
    
    // MARK: - Configuration
    func configure(with app: Application) {
        app.post("reviews", use: create)
        app.get("movies", ":movieId", "reviews", use: findByMovieID)
    }
}
