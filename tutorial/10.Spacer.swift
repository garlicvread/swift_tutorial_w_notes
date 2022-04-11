//
//  10.Spacer.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import Foundation

import SwiftUI

struct SpacerView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("Genres + Moods")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    // 말 그대로 스페이서다. 아무 옵션을 안 주면 화면 끝으로 두 text를 밀어낸다.
                    // .frame에 옵션을 줘서 Spacer의 크기를 변경할 수 있다.
                    Spacer().frame(width: 20, height: 50)
                    
                    Text("View as a List")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                Spacer().frame(width: 50, height: 20)
                
                // Spacer()는 요소를 특정 방향으로 치우치게 만드는 데도 사용할 수 있다.
                // 잘 쓰면 가장자리로부터의 거리도 이걸로 조절할 수 있다.
                HStack {
                    Spacer()
                    
                    Text("테스트용")
                        .font(.system(size: 30, weight: .bold, design: .serif))
                    
                    Spacer().frame(width: 50, height: 50)
                }
            }
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        Image("hiphop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 150)
                        
                        Text("Hip-Hop")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                    
                    ZStack {
                        Image("pop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 150)
                        
                        Text("POP")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                Spacer().frame(width: 100, height: 10)
                
                HStack(spacing: 0) {
                    ZStack {
                        Image("rock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 150)
                        
                        Text("ROCK")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image("latin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 150)
                        
                        Text("LATIN")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                }
            }
            
            
            // Rectangle() 을 divider로 사용할 수 있다. 적절하게 배치하자.
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            
            
            HStack(spacing: 0) {
                Text("Podcasts")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            
                Spacer()
            }

            
            Spacer().frame(height: 10)
            
            VStack(alignment: .leading) {
                Text("Part 1: The National Day Show")
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                
                Spacer()
                
                Text("Selamat bersuti semua. Kami nyanyikan kembali lagu-lagu yang dah biasa kita dengar dalam hari kebangsaan.")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                
                Spacer()
                
                HStack {
                    Image(systemName: "play.circle.fill")
                    Text("TODAY - 24HR 24MIN")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.down.circle")
                }
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
        }
        .padding()
    }
}

struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerView()
            .previewDevice("iPhone 13 Pro")
    }
}
