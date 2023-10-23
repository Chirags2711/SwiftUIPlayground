//
//  Movie.swift
//  FirstSwiftUIApp
//
//  Created by Chirag Sharma on 22/10/23.
//

import Foundation

struct MovieResponse: Decodable{ //top level object in the API response recieved
    let results: [Movie]
}

//Necessary things
struct Movie:Decodable /*: Identifiable  //Must have a Hashable property named id*/ {
    let id: Int //about the data itself
    let title: String
    let overview: String
    let posterPath: String
    var posterURL: URL? { //Async image accepts both optional URL and URL
        URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)") //w400 means width of 400
        //Explore assert
//        let url = URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)")
//        assert(url != nil )
//        return url
    }
}


//Auxillory things. We can remove the extension and type can still function.
extension Movie{ //an extension of Movie: Way in Swift to add some additional behaviour or static data to a type.
    static var mock: Movie{ //static property. It is returning a Movie.
        Movie(id: 507086, title: "Jurasic World Domination", overview: "Four years after Isla Nublar was destroyed, dinosaurs now live and hunt alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the an predators on a planet they now share with history's most fearsome creatures", posterPath: "/w4c0GTpmEQ1CZQNHndTv2PPgf2p.jpg")
    }
}

extension Array<Movie>{
    static var mock: Array<Movie>{ //or use [Movie]
        [
            Movie(id: 507086, title: "Jurasic World Domination", overview: "Four years after Isla Nublar was destroyed, dinosaurs now live and hunt alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the an predators on a planet they now share with history's most fearsome creatures", posterPath: "/w4c0GTpmEQ1CZQNHndTv2PPgf2p.jpg"),
            Movie(id: 799876, title: "The Outfit", overview: "Four years after Isla Nublar was destroyed, dinosaurs now live and hunt alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the an predators on a planet they now share with history's most fearsome creatures", posterPath: "/lZa5EB6PVJBT5mxhgZS5ftqdAm6.jpg"),
            Movie(id: 810693, title: "Jujutsu Kaisen 0", overview: "FYuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won't leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?", posterPath: "/23oJaeBh0FDk2mQ2P240PU9Xxfh.jpg")
        ]
    }
}
