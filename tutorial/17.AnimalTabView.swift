//
//  17.TabView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

struct AnimalTabView: View {
    var body: some View {
        
        // TabView는 TabView {} 형태로 사용하고, {} 안에 탭을 눌렀을 때 전환되는 View를 작성해 넣으면 된다.
        TabView {
            
            // 첫 번째 탭(시작 페이지 느낌)은 맨 위에서 작성했던 AnimalMainView_Tab()을 넣어준다.
            AnimalMainView_Tab()
            
                // .tabItem에는 tab을 화면에 그려주는 코드가 들어간다. 보통 아이콘 Image, Text 정도가 들어감.
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Main")
                }
            
            // 두 번째 탭으로는 위에서 작성한AnimalLikeView를 넣는다.
            AnimalLikedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Liked")
                }
        }
    }
}


struct AnimalTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalTabView()
            .previewDevice("iPhone 13 Pro")
    }
}
