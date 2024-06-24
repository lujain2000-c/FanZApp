//
//  FirstScreenView.swift
//  FanZApp
//
//  Created by لجين إبراهيم الكنهل on 16/12/1445 AH.
//

import SwiftUI

struct FirstScreenView: View {
    @StateObject var vm = DataManager()
    @State var showingSheet = false
    var body: some View {
        ZStack{
            Color("Purple")
            ScrollView{
                VStack(spacing: 56) {
                    ZStack{
                        Rectangle()
                            .fill(Color("Purple2"))
                        //.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                        // .overlay(
                        VStack {
                            HStack(spacing: 32) {
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24,height: 24)
                                    .foregroundColor(Color("LightPurple2"))
                                VStack {
                                    HStack{
                                        Ellipse()
                                            .fill(Color("Green"))
                                            .frame(width: 9,height: 9)
                                        
                                        Text("Live")
                                            .foregroundColor(Color("Green"))
                                        Text("15 hours lift - GW3")
                                            .foregroundColor(Color("LightPurple"))
                                        
                                    }
                                    .font(.footnote)
                                    HStack {
                                        Text("Roshin League")
                                            .fontWeight(.heavy)
                                            .font(.title3)
                                            .foregroundColor(Color("LightPurple2"))
                                        
                                        Ellipse()
                                            .fill(Color("LightPurple"))
                                        
                                            .frame(width: 16,height: 16)
                                            .overlay(
                                                Text("i"))
                                    }
                                }
                                
                                //Spacer()
                                
                                Image("RoshinIcon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 69,height: 64
                                    )
                                    .padding(.leading,42)
                            }
                            .padding(.horizontal,56)
                            HStack(spacing: 16) {
                                
                                CounterView(iconName: "Coins", num: "290")
                                CounterView(iconName: "Stars", num: "600")
                                
                                
                            }.offset(y: 42)
                            
                        }.padding(.top,42)
                    }
                    //   )
                    
                    
                    
                    
                    HStack(spacing:0) {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundColor(Color("Purple2"))
                            .offset(x:-16)
                            .frame(maxWidth: .infinity)
                            .frame(width: 300,height: 60)
                            .overlay(
                                HStack(spacing:16) {
                                    HStack(spacing:4){
                                        Image("Lineup")
                                        Text("Lineup")
                                            .foregroundColor(Color("Yellow"))
                                            .bold()
                                    }
                                    
                                    Image("Leaderboard")
                                    Image("MatchesIcon")
                                    Image("TransfareIcon")
                                    Image("fantaZPoints")
                                }.padding(.leading,32 )
                            )
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundColor(Color("Purple2"))
                                .offset(x:75)
                                .frame(width:180,height: 60)
                            
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.white)
                                .offset(x:20)
                            
                        }
                    }
                    
                    
                    
                    ZStack{
                        
                        Image("Image1")
                          
                        VStack {
                            HStack{
                                CounterView(iconName: "Coins", num: "1M")
                                Spacer()
                                HStack {
                                    CounterView(iconName: "fantaZPoints", num: "124")
                                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                                        .frame(width: 24,height: 26)
                                        .foregroundColor(Color("Purple3"))
                                        .overlay(
                                            Text("?")
                                        )
                                }
                                
                            }
                            .offset(y:-140)
                        .padding(.horizontal,120)
                            VStack(spacing: 0){
                                CardView(y: -90, x: 0)
                                    
                                    HStack(spacing: 24){
                                        CardView(y: -85, x: 0)
                                        CardView(y: -75, x: 0)
                                        CardView(y: -75, x: 0)
                                        CardView(y: -85, x: 0)
                                        
                                    }
                                      
                                    HStack(spacing: 42){
                                        CardView(y: -60, x: 0)
                                        CardView(y: -44, x: 0)
                                        CardView(y: -60, x: 0)
                                      
                                    }
                                    
                                    HStack(spacing: 42){
                                        Button(action:{
                                            showingSheet = true
                                            vm.fetchPlayer(playerNum: "11")
                                        } , label: {
                                            CardView(y: -40, x: 0, name: "Mohamed Sala", number: "11")
                                        })
                                        .sheet(isPresented: $showingSheet, content: {
                                            
                                           
                                            PlayerDetailsView(showingSheet: $showingSheet)
                                          
                                        })
                                            
                                        Button(action:{
                                            showingSheet = true
                                            vm.fetchPlayer(playerNum: "7")
                                        } , label: {
                                            CardView(y: -24, x: 0,name: "Cristiano Ronaldo", number: "7")
                                        })
                                        .sheet(isPresented: $showingSheet, content: {
                                            
                                           
                                            PlayerDetailsView(showingSheet: $showingSheet)
                                          
                                        })
                                  
                                       
                                        CardView(y: -40, x: 0)
                                      
                                    }
                                
                                
                                HStack(spacing: 24){
                                    CardView(y: -4, x: 0)
                                    CardView(y: -4, x: 0)
                                    CardView(y: -4, x: 0)
                                    CardView(y: -4, x: 0)
                                    
                                }
                            }
                        
                            
                        }
                        
                        
                           
                        
                    }
                    //     .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FirstScreenView()
}


//RoundedRectangle(cornerRadius: 30, style: .continuous)

struct CounterView: View {
    var iconName = "Coins"
    var num = "290"
    var body: some View {
        HStack{
            Image(iconName)
            Text(num)
        }
        .foregroundColor(.white)
        .padding(8)
        .padding(.horizontal,0)
        .padding(.horizontal)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
