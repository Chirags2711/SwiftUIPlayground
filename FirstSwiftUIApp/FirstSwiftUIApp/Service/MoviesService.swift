//
//  MoviesService.swift
//  FirstSwiftUIApp
//
//  Created by Chirag Sharma on 22/10/23.
//

import Foundation //We can even use this code in UIKit, as it has no relation with SwiftUI, even in CLI. Good practice: networking layer completely independent from UI layer

class MoviesService{
    func getMoviesFromAPI() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        
///*later stored to tuple */       try await URLSession.shared.data(from: url)  //Built in http client. Shared is configured with default behaviour like timeout, etc. Then call data from url.
            //Method to make network call is an async method, meaning it is allowed to pause during execution. Our getMoviesFromAPI is calling an async method, so it needs to be async as well
        //Also, we need to mark the code as await when we call an async method
        
        //Two methods to handle error: Either deal with it or send it up the chain of callers and let someone else deal with it. We do latter here by adding 'throws'. Marking the corresponding code with try as well.
        //The method returns a tuple with 2 pieces of data.
        
        let (data, _ /*response*/) = try await URLSession.shared.data(from: url)
        
        //Data is binary data(payload returned by network call)
        //Response is the metadata around the https request
        //Here, we are not interested in response, so we replace it with _(ignore it)
        //Now we have to decode it and map it to a struct of type Movie
        //Mark Movie struct as implementing the protocol Decodable. Swift has a built in centralization and decentralization mechanism. The compiler will generate at compile time, all the code to be able to decode JSON with matching fields to that of the properties of the struct.
        
        //API uses snake case(_)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        // we can also code keys if needed(Explicit Mapping)
        
        let decoded = try decoder.decode(MovieResponse.self /*Decodable. Passing an object representing the type movieresponse. (type) */, from: data) /*data received from the network call*/
        //try is needed as decoding may fail if API does not respect the structure of the Movie
        //Also, our JSON will not contain a movie, it will contain an array of Movies. So we need to implement another struct
        
        return decoded.results // to send a array of movies not MovieResponse type
        //Cannot convert return expression of type 'MovieResponse' to return type '[Movie]' : with just decoded.
    }
}
