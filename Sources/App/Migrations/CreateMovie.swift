//
//  CreateMovie.swift
//
//
//  Created by cleanmac on 27/03/21.
//

import Fluent
import FluentPostgresDriver


struct CreateMovie: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("movies") // Table name
            .id()
            .field("title", .string) // Column name
            .create()
    }

    // Undo operation
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("movies").delete() // Drop the table
    }
}
