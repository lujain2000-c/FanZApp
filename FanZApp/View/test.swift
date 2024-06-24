//
//  test.swift
//  FanZApp
//
//  Created by لجين إبراهيم الكنهل on 17/12/1445 AH.
//

import SwiftUI

struct test: View {
    @State private var scrollOffset: CGFloat = 0
    @State var portraitMode = false
        var body: some View {
            ScrollViewReader { scrollView in
                ScrollView {
                    GeometryReader { geometry in
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
                                
                                        Image(systemName: "person").resizable()
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
                                        Text("#22")
                                            
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
                                        
                                        Text("Name")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .offset(y:-130)
                                        Text("Postion")
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
                                scrollOffset = -newValue // Invert the scroll offset
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        scrollView.scrollTo("scrollToThisPosition", anchor: .top)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
}

#Preview {
    test()
}
