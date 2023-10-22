//
//  ContentView.swift //First screen of the App
//  FirstSwiftUIApp
//
//  Created by Chirag Sharma on 22/10/23.

import SwiftUI

//struct MovieView: View { //conforms to the protocol View.
//    
//    let movie: Movie
//    
//    var body: some View {
//        HStack {
//            //SwiftUI's built in type to load an image from a URL
//            AsyncImage(url: movie.posterURL){ image in
//                image.resizable() //returns the image. If not written anything after in, it ignores the loaded image.
//                    .aspectRatio(contentMode: .fit)
//            }placeholder: {
//                 ProgressView()
//            }
//            .frame(width: 80) //proposes the size to the view. View is allowed to disregard it. It can be displayed in a different size(I guess to maintain zoom and scale).
//                //Add resizable to tell image that it's okay to resize.
//                //Add aspect ratio fit to adjust width automatically.
//            
//            //Async mechanism, image is not available immediately. So we need to pass the image a closure for styling. Async image will pass the closure once image is loaded. This closure takes an argument of an image. Closure is a function that you can pass as an argument.
//            
//            VStack(alignment: .leading) /* init config. Important(needed to function). If we don't provide, the default is center. */ /*can be done using inspector as well*/ { //right click and embed in Vstack.    (To everything inside VStack)
//                Text(movie.title)
//                    .font(.headline) /* modifier config, difference is based on what we need to define in init necessarily. In this case, it will just use system font, without sending any default argument. */ // We can even modify it in the inspector after selecting it. It will change the code too. Code is the truth in SwiftUI unlike UIKit(In UIKit, xml file is used for storyboards, which stores all config)
//                Text(movie.overview)
//                    .lineLimit(4)
//            }//.padding() // to put default margins around the VStack. Add it later to HStack
//        }.padding()
//    }
//}

struct MovieView: View { //conforms to the protocol View.
    
    @State var movies : [Movie] = []//State added to update movies as given by API. Allows us to mutate the value inside closures defined in the view. The body needs to be recpmputed whenever the value of property changes
    
    var body: some View {
        List(movies, id: \Movie.id) { movie in
            //Initializer 'init(_:rowContent:)' requires that 'Movie' conform to 'Identifiable'. SwiftUI calculates difference between rows while updating, for that it needs an id. Like Array and cells.
            //Way 1: Key Path : , id: \(Movie.id)
            //Way 2: Make struct Movie of type Identifiable
            HStack {
                AsyncImage(url: movie.posterURL){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }placeholder: {
                     ProgressView()
                }
                .frame(width: 80)
                
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .lineLimit(4)
                }
            }
            .padding()
        }
        .task { //similar to onAppear that calls a closure whenever a view appears. Task is same thing, but it allows us to call async code inside of it
            do{
                let service = MoviesService()
                movies = try await service.getMoviesFromAPI()
            }catch{
                print("Error")
            }
        }
    }
}

#Preview {
//    MovieView(movie: Movie.mock)  // .mock and Movie.mock are same. Compiler auto interprets.
    //MovieView(movies: .mock)  // .mock and [Movie].mock are same. Compiler auto interprets.
    MovieView()
}
