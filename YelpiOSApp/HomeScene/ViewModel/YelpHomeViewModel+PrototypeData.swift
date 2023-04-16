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
                rating:5.0,
                description: "The East Side Gallery is an open-air gallery in Berlin. It consists of a series of murals painted directly on a 1,316 m long remnant of the Berlin Wall, located near the centre of Berlin, on Mühlenstraße in Friedrichshain-Kreuzberg. The gallery has official status as a Denkmal, or heritage-protected landmark.",
                location: "East Side Gallery\nMemorial in Berlin, Germany",
                imageUrl: "image-0"
            ),
            BusinessViewModel(
                name:"Cannon Street",
                rating:5.0,
                description: nil,
                location: "Cannon Street, London",
                imageUrl: "image-1"
            ),
            BusinessViewModel(
                name:"East Side Gallery",
                rating:5.0,
                description: "The Desert Island in Faro is beautiful!! ☀️",
                location: "East Side Gallery\nMemorial in Berlin, Germany",
                imageUrl: "image-2"
            ),
            BusinessViewModel(
                name:"The East Side",
                rating:5.0,
                description: nil,
                location: "East Side Gallery\nMemorial in Berlin, Germany",
                imageUrl: "image-3"
            ),
            BusinessViewModel(
                name:"Garth Pier",
                rating:5.0,
                description: "Garth Pier is a Grade II listed structure in Bangor, Gwynedd, North Wales. At 1,500 feet in length, it is the second-longest pier in Wales, and the ninth longest in the British Isles.",
                location: "Garth Pier\nNorth Wales",
                imageUrl: "image-4"
            ),
            BusinessViewModel(
                name:"Brighton Seafront",
                rating:5.0,
                description: "Glorious day in Brighton!! 🎢",
                location: "Brighton Seafront",
                imageUrl: "image-5"
            )
        ]
    }
}

