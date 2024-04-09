import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    //crate movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    // get all movies
    // /movies
    app.get("movies") { req async throws in
        try await Movie.query(on: req.db)
            .all()
    }
    
    //get movie by id
   
    app.get("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        return movie
    }
}
//    app.get { req async throws in
//        try await req.view.render("index", ["title": "Hello user!"])
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//    
//    // /hotels?sort=dec&search=houston
//    app.get("hotels") { req async throws in
//        let hotelQuery = try req.query.decode(HotelQuery.self)
//        return hotelQuery
//    }
//    
//    app.post("movies") { req async throws in
//       let movie = try req.content.decode(Movie.self)
//        return movie
//    }
//    
//    app.get("custumers", ":custumersId") { req async throws -> String in
//        guard let custumerId = req.parameters.get("custumersId", as: Int.self) else {
//            throw Abort(.badRequest)
//        }
//        return "\(custumerId)"
//    }
//    
//    // movies/
//    app.get("movies") { req async in
//        [Movie(title: "Batman", year: 2023), Movie(title: "Superman", year: 2022), Movie(title: "Spiderman", year: 2020)]
//    }
//    
//    //movies/action
//    app.get("movies", ":genre") { req async throws -> String in
//        guard let genre = req.parameters.get("genre") else {
//            throw Abort(.badRequest)
//        }
//        return "All movies of genre: \(genre)"
//    }
//    
//    // movies/action/2023
//    app.get("movies", ":genre", ":year") { req async throws -> String in
//        
//        guard let genre = req.parameters.get("genre"),
//                let year = req.parameters.get("year")
//        else {
//            throw Abort(.badRequest)
//        }
//        return "All movies of genre: \(genre) for year \(year)"
//    }
//    
//    try app.register(collection: TodoController())


