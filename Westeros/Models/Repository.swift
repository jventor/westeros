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

    func houses(filteredBy: FilterHouse) -> [House]
}

// MARK: - Protocol: Seasonfactory
protocol SeasonFactory {
    
    typealias FilterSeason = (Season) -> Bool
    
    var seasons: [Season] { get }
    
    func season(filteredBy: FilterSeason ) -> [Season]

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
        
        let robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El  Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        
        // Add Characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        return [starkHouse,lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.first{$0.name.uppercased() == name.uppercased()}
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
        
        let episode1_1 = Episode(title: "Winter Is Coming", issueDate: "17/04/2011", season: season1)
        let episode1_2 = Episode(title: "The Kingsroad", issueDate: "24/04/2011", season: season1)
        season1.add(episodies: episode1_1, episode1_2)
        
        let episode2_1 = Episode(title: "The North Remembers", issueDate: "01/04/2012", season: season2)
        let episode2_2 = Episode(title:  "The Night Lands", issueDate: "08/04/2012", season: season2)
        season2.add(episodies: episode2_1, episode2_2)
        
        let episode3_1 = Episode(title: "Valar Dohaeris", issueDate: "31/03/2013", season: season3)
        let episode3_2 = Episode(title: "Dark Wings, Dark Words", issueDate: "07/04/2013", season: season3)
        season3.add(episodies: episode3_1, episode3_2)
        
        let episode4_1 = Episode(title: "Two Swords", issueDate: "06/04/2014", season: season4)
        let episode4_2 = Episode(title: "The Lion and the Rose", issueDate: "13/04/2014", season: season4)
        season4.add(episodies: episode4_1, episode4_2)
        
        let episode5_1 = Episode(title: "The Wars to Come", issueDate: "12/04/2015", season: season5)
        let episode5_2 = Episode(title: "The House of Black and White", issueDate: "19/04/2015", season: season5)
        season5.add(episodies: episode5_1, episode5_2)
        
        let episode6_1 = Episode(title: "The Red Woman", issueDate: "24/04/2016", season: season6)
        let episode6_2 = Episode(title: "Home", issueDate: "01/05/2016", season: season6)
        season6.add(episodies: episode6_1, episode6_2)
        
        let episode7_1 = Episode(title: "Dragonstone", issueDate: "16/07/2017", season: season7)
        let episode7_2 = Episode(title: "Stormborn", issueDate: "23/07/2017", season: season7)
        season7.add(episodies: episode7_1, episode7_2)
        
        let episode8_1 = Episode(title: "Episode 08x01", issueDate: "01/01/2019", season: season8)
        let episode8_2 = Episode(title: "Episode 08x02", issueDate: "01/01/2019", season: season8)
        season8.add(episodies: episode8_1, episode8_2)
        
        return [ season1, season2, season3, season4, season5, season6, season7, season8]
    }
    
    func season(filteredBy: FilterSeason) -> [Season]{
        return seasons.filter(filteredBy)
    }
}
