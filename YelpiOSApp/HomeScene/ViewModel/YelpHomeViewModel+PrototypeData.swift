//
//  HomeView+PrototypeData.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.


extension BusinessViewModel {
    static var prototypeFeed: [BusinessViewModel] {
        return [
            BusinessViewModel(
                name:"The East Side",
                imageUrl: "image-0",
                rating:5.0,
                reviewCount: 10,
                //description: "The East Side Gallery is an open-air gallery in Berlin. It consists of a series of murals painted directly on a 1,316 m long remnant of the Berlin Wall, located near the centre of Berlin, on Mühlenstraße in Friedrichshain-Kreuzberg. The gallery has official status as a Denkmal, or heritage-protected landmark.",
                location: "East Side Gallery\nMemorial in Berlin, Germany"
               
            ),
            BusinessViewModel(
                name:"Cannon Street",
                imageUrl: "image-1",
                rating:3.0,
                reviewCount: 10,
                location: "Cannon Street, London"
                
            ),
            BusinessViewModel(
                name:"East Side Gallery",
                imageUrl: "image-2",
                rating:3.5,
                reviewCount: 10,
                location: "East Side Gallery\nMemorial in Berlin, Germany"
                
            ),
            BusinessViewModel(
                name:"The East Side",
                imageUrl: "image-3",
                rating:2.0,
                reviewCount: 10,
                location: "East Side Gallery\nMemorial in Berlin, Germany"
                
            ),
            BusinessViewModel(
                name:"Garth Pier",
                imageUrl: "image-4",
                rating:2.5,
                reviewCount: 10,
                location: "Garth Pier\nNorth Wales"
               
            ),
            BusinessViewModel(
                name:"Brighton Seafront",
                imageUrl: "image-5",
                rating:5.0,
                reviewCount: 10,
                location: "Brighton Seafront"
               
            )
        ]
    }
}

