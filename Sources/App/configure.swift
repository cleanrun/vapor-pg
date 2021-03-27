import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Connecting to a PostgresSQL Database
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "moviesdb"), as: .psql)
    
    // Add the migration, only called 1 time
    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(CreateActor())
    app.migrations.add(CreateMovieActor())

    // register routes
    try routes(app)
}
