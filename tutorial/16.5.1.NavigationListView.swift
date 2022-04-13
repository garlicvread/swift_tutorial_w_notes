//
//  16.5.1.NavigationListView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// AnimalMainView를 작성했으니 NavigationView안에서 사용되는 AnimalListView를 작성해야 한다.
// AnimalListView에서는 각 동물의 이미지, 이름(Title), 설명(Description)을 보여준다.

// AnimalListView는 각 항목을 수직축 방향으로 쌓아서 보여줄 것이기 떄문에 HStack으로 전체 모양을 잡고
// 각 항목 내부에서는 이미지가 왼쪽, 타이틀과 설명이 수직으로 배치된 영역은 그 오른쪽에 배치할 것이다. 따라서

//     HStack {
//          Image()  // image() 의 ()에는 나중에 animal.image를 작성함.
//
//          VStack {
//              Text("Title")  // 나중에 "Title" --> animal.title 작성
//
//              Text("Headline")  // 나중에 "Headline" --> animal.headline 작성
//          }
//     }

// 모양으로 와꾸를 잡아야 한다.

struct AnimalListView: View {

    // 동물 데이터를 받아올 변수 선언
    // Image, Text 항목 두 개에도 적절한 animal 의 변수값을 입력한다.
    var animal: Animal

    var body: some View {
        HStack {
            Image(animal.image)

                // Image를 다듬는다.
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(animal.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(animal.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                    .lineLimit(2)  // 텍스트 항목이 너무 길어질 수도 있으므로 두 번째 줄까지만 나타나도록 제한한다.
            }
        }
        .padding(.vertical, 4)
    }
}
