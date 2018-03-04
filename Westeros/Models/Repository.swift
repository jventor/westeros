//
//  Repository.swift
//  Westeros
//
//  Created by Jaime Ventor on 13/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import Foundation

// MARK: - Class: Repository
final class Repository {
    // MARK: - Properties
    static let local  =  LocalFactory()
}

// MARK: - Protocol: HouseFactory
protocol HouseFactory{
    typealias FilterHouse = (House) -> Bool
    
    var houses: [House]{ get }
    
    func house (named: String) -> House?
    
    func house (named: Houses) -> House?
    
    func houses(filteredBy: FilterHouse) -> [House]
}

// MARK: - Protocol: Seasonfactory
protocol SeasonFactory {
    typealias FilterSeason = (Season) -> Bool

    var seasons: [Season] { get }

    func seasons(filteredBy: FilterSeason ) -> [Season]
}

// MARK: - Class: LocalFactory
final class LocalFactory: HouseFactory {

    var houses: [House] {
        let starkSigil   = Sigil(image: #imageLiteral(resourceName: "stark.png"), description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.png"), description: "León rampante")
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter Is Coming", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear Me Roar!", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let _ = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        let _ = Person(name: "Arya", house: starkHouse)
        let _ = Person(name: "Tyrion", alias: "El  Enano", house: lannisterHouse)
        let _ = Person(name: "Cersei", house: lannisterHouse)
        let _ = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        let _ = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        return [starkHouse,lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.first{$0.name.uppercased() == name.uppercased()}
        return house
    }
    
    func house (named name: Houses) -> House? {
        let house = houses.first{$0.name.uppercased() == name.rawValue.uppercased()}
        return house
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
}

// MARK: - Class extension: Localfactory
extension LocalFactory: SeasonFactory {

    var seasons: [Season] {
        let season1 = Season(name: "Season 1", releaseDate: "17/04/2011", image: #imageLiteral(resourceName: "Season1.jpg"))
        let season2 = Season(name: "Season 2", releaseDate: "01/04/2012", image: #imageLiteral(resourceName: "Season2.jpg"))
        let season3 = Season(name: "Season 3", releaseDate: "31/03/2013", image: #imageLiteral(resourceName: "Season3.jpg"))
        let season4 = Season(name: "Season 4", releaseDate: "06/04/2014", image: #imageLiteral(resourceName: "Season4.jpg"))
        let season5 = Season(name: "Season 5", releaseDate: "12/04/2015", image: #imageLiteral(resourceName: "Season5.jpg"))
        let season6 = Season(name: "Season 6", releaseDate: "24/04/2016", image: #imageLiteral(resourceName: "Season6.jpg"))
        let season7 = Season(name: "Season 7", releaseDate: "16/07/2017", image: #imageLiteral(resourceName: "Season7.jpg"))
        let season8 = Season(name: "Season 8", releaseDate: "01/01/2019", image: #imageLiteral(resourceName: "Season8.jpg"))
        
        let _ = Episode(title: "Winter Is Coming", issueDate: "17/04/2011", season: season1)
        let _ = Episode(title: "The Kingsroad", issueDate: "24/04/2011", season: season1)
        
        let _ = Episode(title: "The North Remembers", issueDate: "01/04/2012", season: season2)
        let _ = Episode(title:  "The Night Lands", issueDate: "08/04/2012", season: season2)
        
        let _ = Episode(title: "Valar Dohaeris", issueDate: "31/03/2013", season: season3)
        let _ = Episode(title: "Dark Wings, Dark Words", issueDate: "07/04/2013", season: season3)
        
        let _ = Episode(title: "Two Swords", issueDate: "06/04/2014", season: season4)
        let _ = Episode(title: "The Lion and the Rose", issueDate: "13/04/2014", season: season4)
        
        let _ = Episode(title: "The Wars to Come", issueDate: "12/04/2015", season: season5)
        let _ = Episode(title: "The House of Black and White", issueDate: "19/04/2015", season: season5)

        let _ = Episode(title: "The Red Woman", issueDate: "24/04/2016", season: season6)
        let _ = Episode(title: "Home", issueDate: "01/05/2016", season: season6)

        let _ = Episode(title: "Dragonstone", issueDate: "16/07/2017", season: season7)
        let _ = Episode(title: "Stormborn", issueDate: "23/07/2017", season: season7)

        let _ = Episode(title: "Episode 08x01", issueDate: "01/01/2019", season: season8)
        let _ = Episode(title: "Episode 08x02", issueDate: "02/01/2019", season: season8)

        return [ season1, season2, season3, season4, season5, season6, season7, season8]
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season]{
        return seasons.filter(filteredBy)
    }
}
