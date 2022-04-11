//
//  StaticList.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import Foundation

import SwiftUI

struct ListView_1: View {
    var body: some View {
        // List의 기본 형태: List{}
        // {} 안에 List로 보여줄 목록 컨텐츠를 입력한다.
        List {
            HStack {
                Text("Sunny")
                Spacer()
                Image(systemName: "sun.max")
                    .foregroundColor(.green)
            }

            // List 내 모든 요소에 modifier를 적용하려면 List 바깥에 한 번만 선언하면 된다.
            // 그리고 List 내 각 요소에 서로 다른 modifier를 적용하려면 각 요소에 modifier를 적용하면 된다.
            // 여기서는 HStack 요소의 크기를 변경하였다.
            // * 참고: .frame()은 .padding() 위에 넣어야 적용된다.
            .frame(height: 50)
            .padding()
            
            HStack {
                Text("Rainy")
                Spacer()
                Image(systemName: "cloud.rain")
                    .foregroundColor(.green)
            }
            .padding()
            
            HStack {
                Text("Cloudy")
                Spacer()
                Image(systemName: "smoke")
                    .foregroundColor(.green)
            }
            .padding()
            
            HStack{
                Text("Windy")
                Spacer()
                Image(systemName: "wind")
                    .foregroundColor(.green)
            }
            .padding()
            
            HStack{
                Text("Snowy")
                Spacer()
                Image(systemName: "snow")
                    .foregroundColor(.green)
            }
            .padding()
        }
        
        // List 내부 요소에 modifier를 적용하려면 List 바깥에 한 번만 선언하면 된다.
        // 예컨대 List에 font modifier를 적용하면 List 내부의 모든 Text에 font가 적용된다.
        .font(.system(size: 20, weight: .bold, design: .rounded))
    }
}



struct ListView_1_Previews: PreviewProvider {
    static var previews: some View {
        ListView_1()
            .previewDevice("iPhone 13 Pro")
    }
}
