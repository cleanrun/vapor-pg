import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: - Route Controllers
    let movieController = MovieController()
    let reviewController = ReviewController()
    
    // MARK: - Route Configurations
    movieController.configure(with: app)
    reviewController.configure(with: app)
    
}
    
    /*
    // actors (POST)
    app.post("actors") { req -> EventLoopFuture<Actor> in
        let actor = try req.content.decode(Actor.self)
        return actor.create(on: req.db).map { actor }
    }
    
    // actors (GET)
    app.get("actors") { req in
        Actor.query(on: req.db).with(\.$movies).all()
    }
    
    // movie/:id/actor/:id (POST)
    app.post("movie", ":movieId", "actor", ":actorId") { req -> EventLoopFuture<HTTPStatus> in
        let movie = Movie.find(req.parameters.get("movieId"), on: req.db).unwrap(or: Abort(.notFound))
        let actor = Actor.find(req.parameters.get("actorId"), on: req.db).unwrap(or: Abort(.notFound))
        
        return movie.and(actor).flatMap { (movie, actor) in
            movie.$actors.attach(actor, on: req.db)
        }.transform(to: .ok)
    }
    
    // movies (POST)
    app.post("movies") { req -> EventLoopFuture<Movie> in
        let movie = try req.content.decode(Movie.self) // content = body of an HTTP Request
        return movie.create(on: req.db).map { movie }
    }
    
    // movies (GET)
    app.get("movies") { req in
        Movie.query(on: req.db).with(\.$reviews).with(\.$actors).all()
    }
    
    // movies by ID (GET)
    app.get("movies", ":id") { req -> EventLoopFuture<Movie> in
        //Movie.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound))
        let id = req.parameters.get("id", as: UUID.self)
        return Movie.query(on: req.db)
            .filter(\.$id == id!)
            .with(\.$reviews)
            .first()
            .unwrap(or: Abort(.notFound))
    }
    
    // movies update (PUT)
    app.put("movies") { req -> EventLoopFuture<HTTPStatus> in
        let movie = try req.content.decode(Movie.self)
        return Movie.find(movie.id, on: req.db).unwrap(or: Abort(.notFound)).flatMap {
            $0.title = movie.title
            return $0.update(on: req.db).transform(to: .ok)
        }
    }
    
    // movies delete (DELETE)
    app.delete("movies", ":id") { req -> EventLoopFuture<HTTPStatus> in
        Movie.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound)).flatMap {
            $0.delete(on: req.db)
        }.transform(to: .ok)
    }
    
    // reviews (POST)
    app.post("reviews") { req -> EventLoopFuture<Review> in
        let review = try req.content.decode(Review.self)
        return review.create(on: req.db).map { review }
    }
    */
