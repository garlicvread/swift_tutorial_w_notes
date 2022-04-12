//
//  16.5.1.NavigationDetailView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI


struct AnimalsDetailView: View {
    
    // AnimalDetailView도 animal 데이터를 받아와야 하므로 데이터를 받을 수 있는 animal 변수를 선언한다.
    var animal: Animal
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            // 이미지(Image), 타이틀(Title), 설명(Description)을 세로 방향으로 배치한다.
            VStack(spacing: 20) {
                Image(animal.image)  // Image는 View 최상단에 배치
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                // 이때 타이틀, 설명은 String 타입이므로 따로 VStack으로 묶어서 배치한다.
                VStack(alignment: .leading, spacing: 20) {
                    
                    // 타이틀 오른쪽으로 좋아요 표시용 하트를 하나 배치할 생각이므로 일단 HStack을 사용한다.
                    HStack {
                        Text(animal.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button(action: {
                        }, label: {
                            Image(systemName: animal.isLike ? "heart.fill" : "heart")
                        })
                    }
                    Text(animal.headline)
                        .font(.headline)
                    
                    // .upppercased() : learn more about을 모두 대문자로 바꿔주는 코드
                    Text("learn more about \(animal.title)".uppercased())
                        .fontWeight(.heavy)
                    
                    Text(animal.description)
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 100)
        }
        // View 확장을 위한 것. 기본값으로 설정된 SafeArea영역을 무시하고 내용을 디스플레이 끝까지 다 채워서 보여준다.
        // 여기서는 상단의 SafeArea를 무시하기 위해 .top 옵션을 줬다.
        .edgesIgnoringSafeArea(.top)
    }
}
