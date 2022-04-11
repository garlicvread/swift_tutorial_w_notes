//
//  DynamicList.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import Foundation

import SwiftUI


// Dynamic List는 앞서 살펴본 Static List에 비해 더 효율적인 Listing이 가능하다.
// array 요소를 받아와 List로 보여주기 때문.
struct ListView_2: View {
    var body: some View {
        // PlayList를 array로 만들기 위해 List() {}의 () 안에 playlists를 넣는다.
        // 또, array의 각 요소를 불러오기 위해 {} 안에 list in을 작성한다.
        // List의 컨텐츠가 담긴 View를 {} 안에 넣는다.
        // 여기서는 CardView()를 넣고, CardView()의 ()안에 playlists 중 하나의 값을 담고 있는 list를 넣는다.
        // 이때 list는 CardView 안의 var list의 그 list인데, 이 list가 PlayList로부터 값을 받아오므로 아래로 쭉 내려가서 PlayList를 가 보면 값의 형식이 지정돼 있는 것을 볼 수 있다.
        List(playlists){ list in
            CardView(list: list)
        }
        // list의 스타일 지정
        // 스타일 지정시 사용 가능한 옵션: DefaultListStyle, GroupedListStyle, InsetGroupedListStyle, PlainListStyle, InsetListStyle, SidebarListStyle
        .listStyle(SidebarListStyle())
    }
}

struct CardView: View {
    // CardView: List 내부 각 요소의 UI로 사용되는 View
    // 썸네일을 보여주는 ImageView, 이름을 보여주는 TextView, 퍼센트를 보여주는 ProgressView로 구성됨
    
    // PlayList 타입 값을 저장할 변수 list 선언
    // PlayList와 CardView의 각 변수를 매칭한다.
    var list: PlayList
        
        
    var body: some View {
        VStack(spacing:0) {
            // Image에 list.imageName 입력
            Image(list.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)

            VStack(alignment: .leading) {
                HStack {
                    Text(list.title)
                        .bold()
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .font(.title2)

                // Text에 list.name 입력
                Text(list.name)
                    // .caption: Font.TextStyle의 한 종류. .caption의 경우 size: 12, weight: .regular
                    .font(.caption)

                HStack {
                    // ProgressiView에 list.percent 입력
                    ProgressView(value: list.percent, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.yellow))
                        .frame(height: 10)
                    
                    Text("\(Int(list.percent * 100))%")
                    // 퍼센트 * 100 한 값을 정수형으로 만든 다음 % 기호를 붙인다. \ : 반환값 그대로 출력하겠다는 의미의 정규표현식이다.
                        .font(.caption)
                }
            }
            .padding()
        }
        .padding()
        .background(Color.black)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}


let playlists = [
    PlayList(title: "ROCK", name: "Genre", percent: 0.2, imageName: "rock"),
    PlayList(title: "POP", name: "Genre", percent: 0.4, imageName: "pop"),
    PlayList(title: "LATIN", name: "Genre", percent: 0.5, imageName: "latin"),
    PlayList(title: "HIP-HOP", name: "Genre", percent: 0.1, imageName: "hiphop")
]

// Identifiable: array 내 요소가 식별되도록 하는 코드
// UUDI(): 식별에 사용하는 고유한 값을 만들어주는 코드. 일반적으로 중복되지 않는 고유값을 만들어준다.
struct PlayList: Identifiable{
    let id = UUID()
    let title: String
    let name: String
    let percent: Double
    let imageName: String
}


struct ListView_2_Previews: PreviewProvider {
    static var previews: some View {
        ListView_2()
            .previewDevice("iPhone 13 Pro")
    }
}

