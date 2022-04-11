//
//  15.ProfileList.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// ProfileList 구조체로 배열을 만드는 코드.
// 앞서 본 ScrollView와 방향이 다르다.
struct ProfileListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 30) {
                // profileLists 라는 array의 인자를 받아와서 처리
                // 받아오는 각각의 인자의 id는 \.self 라는 코드를 통해 고유한 값을 갖게 된다.
                ForEach(profileLists, id: \.self) { profile in
                    
                    HStack(spacing: 30) {
                        Text(profile.text1)
                            .frame(width: 150, height: 150)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .background(.teal)
                        
                        Text(profile.text2)
                            .frame(width: 150, height: 150)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                            .background(.yellow)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct ProfileList: Identifiable, Hashable {
    let id = UUID()
    let text1: String
    let text2: String
}

let profileLists = [
    ProfileList(text1: "asd", text2: "AAA"),
    ProfileList(text1: "sdf", text2: "BBB"),
    ProfileList(text1: "dfg", text2: "CCC"),
    ProfileList(text1: "fgh", text2: "DDD"),
    ProfileList(text1: "ghj", text2: "EEE"),
    ProfileList(text1: "qwe", text2: "FFF"),
    ProfileList(text1: "wer", text2: "GGG"),
    ProfileList(text1: "ert", text2: "HHH")
]

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
            .previewDevice("iPhone 13 Pro")
    }
}
