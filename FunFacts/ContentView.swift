//
//  ContentView.swift
//  FunFacts
//
//  Created by Ramill Ibragimov on 11.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showFact = true
    @State private var factCounter = 0
    @State private var colorCounter = 0
    
    var body: some View {
        ZStack {
            Color(colors.allValues[colorCounter].rawValue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Did you Know?")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(.top, 75)
                        .padding(.leading, 30)
                    Spacer()
                }
                
                Spacer()
                
                Text(facts[factCounter])
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                    .padding(.top, 60)
                    .opacity(self.showFact ? 1 : 0)
                    .offset(y: self.showFact ? 0 : 60)
                
                Spacer()
                
                Button(action: {
                    self.showFacts()
                }) {
                    Text("Show Another Fun Fact")
                        .font(.system(size: 15))
                        .foregroundColor(Color(colors.allValues[colorCounter].rawValue))
                }
                .padding()
                .padding(.horizontal, 60)
                .background(Color.white)
                .padding(.bottom, 60)
            }
        }
    }
    
    func showFacts() {
        self.showFact = false
        withAnimation {
            self.factCounter = self.factCounter < facts.count - 1 ? self.factCounter + 1 : 0
            self.colorCounter = self.colorCounter < colors.allValues.count - 1 ? self.colorCounter + 1 : 0
            self.showFact = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
