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
                name:"The East Side",
                rating:5.0,
                description: nil,
                location: "Cannon Street, London",
                imageUrl: "image-1"
            ),
            BusinessViewModel(
                name:"The East Side",
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
                name:"The East Side",
                rating:5.0,
                description: "Garth Pier is a Grade II listed structure in Bangor, Gwynedd, North Wales. At 1,500 feet in length, it is the second-longest pier in Wales, and the ninth longest in the British Isles.",
                location: "Garth Pier\nNorth Wales",
                imageUrl: "image-4"
            ),
            BusinessViewModel(
                name:"The East Side",
                rating:5.0,
                description: "Glorious day in Brighton!! 🎢",
                location: "Brighton Seafront",
                imageUrl: "image-5"
            )
        ]
    }
}


struct Countries {
    static let all = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czechia", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini (formerly Swaziland)", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (formerly Burma)", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia (formerly Macedonia)", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama"]
}
