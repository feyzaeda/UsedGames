//
//  ContentView.swift
//  UsedGames
//
//  Created by Feyza Eda TÜRK on 14.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    let gameStore = GameStore()
    
    var body: some View {
        List(gameStore.games){
            (game) in
            GameListItem(game: game, numberFormatter: Formatters.dollarFormatter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GameListItem: View {
    
    var game : Game
    var numberFormatter : NumberFormatter = Formatters.dollarFormatter
    
    var body: some View {
        HStack{
            VStack(alignment: .leading , spacing: 4.0){
                Text(game.name).font(.body)
                Text(game.serialNumber).font(.caption).foregroundColor(Color(white: 0.65))
            }
            Spacer()
            Text(NSNumber(value : game.priceInDollar) ,  formatter: numberFormatter).font(.title2)
                .foregroundColor(game.priceInDollar > 30 ? .blue : .gray)
        }
        .padding(.vertical , 6)
    }
}
