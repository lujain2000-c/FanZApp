//
//  PlayerDetailsView.swift
//  FanZApp
//
//  Created by لجين إبراهيم الكنهل on 17/12/1445 AH.
//

import SwiftUI

struct PlayerDetailsView: View {
    
    //@Environment(\.dismiss) var dismiss
    @StateObject var vm = DataManager()
    @Environment(\.presentationMode) var presentationMode
    @Binding var showingSheet: Bool
    @State var portraitMode = false
    @State private var scrollOffset: CGFloat = 0
    
   
    var body: some View {
        //
        ScrollViewReader { scrollView in
            ZStack{
                Color("Purple1")
            ScrollView {
    
            

               
//                    Rectangle()
//                               .frame(maxWidth: .infinity,maxHeight: .infinity)
//                               .foregroundColor(.purple1)

                    GeometryReader { geometry in
                    
                 
                    Image("Back1")
                        
                    
                    VStack(spacing: 24){
                        
                        HStack(alignment: .top,spacing: 42) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.body.weight(.bold))
                                .frame(width: 36, height: 36)
                                .foregroundColor(.secondary)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                            // .strokeStyle(cornerRadius: 14)
                            
                            Rectangle()
                                .frame(width: 180, height: 250, alignment: .top)
                                .shadow(radius: 8.0)
                            
                                .overlay(
                                    
                                    VStack {
                                        ZStack {
                                            Image("Back1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                            
                                            AsyncImage(url: URL(string: "\(vm.player.image)"))
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 80, height: 100, alignment: .top)
                                                .mask( Capsule())
                                            //.padding(.top,42)
                                            HStack(alignment:.top){
                                                VStack {
                                                    Image("RoshinSmallIcon")
                                                    //  Text("23/24")
                                                    //(.footnote)
                                                    //     .foregroundColor(.white)
                                                }
                                                Spacer()
                                                Image("RoshinSmallIcon")
                                            }
                                        }//.padding(.top,24)
                                        // .frame(maxWidth: .infinity,maxHeight: .infinity)
                                        VStack{
                                            Text("#\(vm.player.number)")
                                            
                                                .font(.caption2)
                                                .bold()
                                                .foregroundColor(Color("Yellow"))
                                                .offset(y:-150)
                                            
                                                .background(
                                                    RoundedRectangle(cornerRadius: 9)
                                                        .fill(.indigo)
                                                        .frame(width: 24, height: 24)
                                                        .offset(y:-150)
                                                )
                                            
                                            Text("\(vm.player.name)")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .offset(y:-130)
                                            Text("\(vm.player.position)")
                                                .font(.caption2)
                                                .foregroundColor(.white)
                                                .offset(y:-130)
                                        }
                                        // .offset(y:-24)
                                        // .padding(.bottom)
                                    } .frame(maxWidth: .infinity,maxHeight: .infinity)
                                    
                                )
                                .rotationEffect( .degrees(portraitMode ?  270 : 360))
                                .onTapGesture {
                                    portraitMode.toggle()
                                }
                            
                            // .frame(width: 68,height: 94)
                                .cornerRadius(8.0)
                            //.offset(x:0,y:50)
                            //.offset(y: -70)
                                .foregroundColor(.purple)
                                .opacity(0.8)
                                .rotationEffect(.degrees(Double(scrollOffset)))
                                .onChange(of: geometry.frame(in: .global).minY) { newValue in
                                    scrollOffset = -newValue + 69.0// Invert the scroll offset
                                }
                            Button(action: {presentationMode.wrappedValue.dismiss()}, label: { Image(systemName: "xmark")
                                    .font(.body.weight(.bold))
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.secondary)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))})
                            
                            // .strokeStyle(cornerRadius: 18)
                        }.padding(.bottom,24)
                        //                    .onTapGesture {
                        //                        showingSheet = false
                        //
                        //
                        //                }
                        // Spacer()
                        HStack {
                            CounterView()
                            CounterView()
                            CounterView()
                        }
                        
                        Text("\(vm.player.name)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("LightPurple2"))
                        Text("\(vm.player.position)")
                            .font(.footnote)
                            .foregroundColor(Color("LightPurple2"))
                        
                        //    ZStack{
                        Rectangle()
                        // .frame(maxWidth: .infinity)
                            .frame(width: 400,height: 100)
                            .cornerRadius(50)
                            .foregroundColor(.purple1.opacity(0.7))
                            .shadow(radius: 10)
                            .overlay(
                                HStack(spacing: 24){
                                    AsyncImage(url: URL(string: "\(vm.player.image)"))
                                        .font(.body.weight(.bold))
                                        .frame(width: 36, height: 36)
                                        .foregroundColor(.secondary)
                                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    Text("Player Info")
                                        .foregroundColor(Color("LightPurple2"))
                                    
                                    Spacer()
                                    
                                    Ellipse()
                                        .fill(Color("LightPurple"))
                                    
                                        .frame(width: 24,height: 24)
                                        .overlay(
                                            Text("i"))
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24,height: 24)
                                        .foregroundColor(Color("LightPurple2"))
                                    
                                }.padding(.horizontal)
                            )
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 400,height: 360)
                                .cornerRadius(50)
                                .foregroundColor(.purple1.opacity(0.7))
                                .shadow(radius: 10)
                            .padding(.vertical,24)
                            
                            VStack {
                                HStack(alignment: .top){
                                    Text("Transfer Price")
                                    Text("\(vm.player.price)")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    Spacer()
                                    Text("Rating")
                                    Text("\(vm.player.price)")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                   // Spacer()
                                }
                                HStack(alignment: .top){
                                    Text("Card Type")
                                    Text("FREE)")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    Spacer()
                                    Text("Rewardes")
                                    Text("X1")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    //Spacer()
                                }
                                HStack(alignment: .top){
                                    Text("Season")
                                    Text("23-24")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    Spacer()
                                    Text("Team")
                                    Text("\(vm.player.team)")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    //Spacer()
                                }
                                HStack(alignment: .top){
                                    Text("Country") 
                                    Text("\(vm.player.country)")
                                    Spacer()
                                    Text("Position")
                                    Text("\(vm.player.position)")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .foregroundColor(Color("LightPurple2"))
                                    //Spacer()
                                }
                            }
                            .foregroundColor(Color("LightPurple"))
                            .font(.footnote)
                            .padding(.horizontal,56)
                            
                        }
                            
                        
                        Rectangle()
                            .frame(width: 400,height: 360)
                            .cornerRadius(50)
                            .foregroundColor(.purple1.opacity(0.7))
                            .shadow(radius: 10)
                        //}.padding(.vertical,24)
                        
//                        Rectangle()
//                            .frame(width: 400,height: 150)
//                            .cornerRadius(50)
//                            .foregroundColor(.purple1.opacity(0.7))
//                            .shadow(radius: 10)
//                            .overlay(
//                                VStack{
//                                    Text("NEXT MATCH")
//                                        .foregroundColor(Color("LightPurple2"))
//                                    
//                                    VStack(spacing: 4){
//                                        Text("12AUG")
//                                            .foregroundColor(Color("LightPurple"))
//                                        HStack{
//                                            Text("AL-HILAL FC")
//                                            Text("20:00")
//                                            
//                                            Text("AL-NASSR Club")
//                                        }
//                                        .foregroundColor(Color("LightPurple"))
//                                        
//                                        
//                                    }
//                                }
                          //  )
                        
                    }.padding(.top,32)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        scrollView.scrollTo("scrollToThisPosition", anchor: .top)
                    }
                
                //.ignoresSafeArea()
                
            }//
            } //.ignoresSafeArea(.l)//
        }
     
        
//        .clipShape(RoundedRectangle(cornerRadius: 28))
//        .overlay {
//                // MARK: Drag Indicator
//           
//          //.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
//               // .frame(maxWidth: .infinity, alignment: .trailing)
//                //.padding(.top, 42)
//               
//            
//            
//            
//        }
    }
}

#Preview {
    PlayerDetailsView( showingSheet: .constant(true))
}
