//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Li Ruixin on 16/5/2022.
//
//view: the UI

import SwiftUI
let stroke_width: CGFloat = 4

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                ForEach(viewModel.model.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
//
//            Spacer()
//
//            HStack{
//                remove
//                Spacer()
//                add
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
//                var remove:some View{
//                    Button(action: {
//                        if imgCnt > 1 {
//                            imgCnt -= 1
//                        }
//                    }, label: {
//                        Image(systemName: "minus.circle")
//                    })
//                }
//                var add:some View{
//                    Button(action: {
//                        if imgCnt < pictures.count {
//                            imgCnt += 1
//                        }
//                    }, label: {
//                        Image(systemName: "plus.circle")
//                    })
//                }
        }
        .padding(.horizontal)
        
    }
    

}

struct CardView: View{
    let card: MemoryGame<String>.Card//minumum priveledge
    
    var body: some View{
        ZStack(alignment: .center) {
            let backgroud = RoundedRectangle(cornerRadius: 32)
            if card.isFaceUp {
                backgroud.foregroundColor(.white)
                backgroud
                    //.inset(by: stroke_width/2)
                    //.stroke(lineWidth: stroke_width)
                    .strokeBorder(lineWidth: stroke_width)
                Text(card.context).font(.largeTitle)
            }
            else if card.isMatched{
                backgroud
                    .strokeBorder(style: StrokeStyle(lineWidth: stroke_width, dash: [1]))//(lineWidth: stroke_width,)
                    .foregroundColor(.white)
                VStack{
                    Text("someone")
                    Text("killed")
                    Text("SquareMan!")
                }
            }
            else{
                backgroud
            }
        }
    }
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
//        EmojiMemoryGameView()
//            .preferredColorScheme(.light)
            
    }
}
