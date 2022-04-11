//
//  14.ScrollView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import Foundation

import SwiftUI

// 가로 방향 스크롤 뷰 만들기
struct StoryView: View {
    // 보여줄 텍스트 배열 생성. 여기서는 그림 넣기 귀찮으니까 텍스트 어레이 2 개로 처리한다.
    let textList1 = ["asd", "sdf", "dfg", "fgh", "ghj", "qwe", "wer", "ert"]
    let textList2 = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG", "HHH"]
    
    var body: some View {
        
        // ScrollView() {} 의 () 내부에는 스크롤 방향 및 indicator 표시 여부에 대한 코드를 작성한다.
        // {} 내부에는 ScrollView 안에서 보여주려는 View를 작성한다.
        // Axis.Set.horizontal: 가로 방향 스크롤을 구현하는 코드
        // 세로 방향 스크롤은 Axis.Set.vertical로 구현한다.
        // 근데 기본값이 세로 방향 스크롤이라 아무 것도 안 넣어도 세로로 스크롤 되기는 한다.
        // indicator는 스크롤할 때 나타나는 바를 표시할 것인지 여부를 결정하는 변수이다.
        // showsIndicators: false --> 안 보임, showsIndicators: true --> 보임. 기본값은 보이게 돼 있음.
        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
            // ScrollView는 보통 Stack과 ForEach를 함께 사용한다.
            // 여기서는 가로 스크롤을 할 예정이므로 HStack을 사용한다.
            
            HStack(spacing: 50) {
                
                // ForEach는 항목이 한 화면에 다 담기지 않는 경우 사용한다.
                // 이때 반복 횟수는 textList1의 길이민큼으로 설정한다.
                ForEach(0 ..< textList1.count) { index in
                    VStack(spacing: 0) {
                        Text(textList1[index])
                            .frame(width: 100, height: 100)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                            .background(.yellow)
                        
                        Spacer().frame(width: 100, height: 20)
                        
                        Text(textList2[index])
                            .font(.title)
                            .bold()
                            .frame(width: 100, height: 100)
                            .padding(.vertical, 20)
                            .background(.gray)
                    }
                }
            }
            .padding(15)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
            .previewDevice("iPhone 13 Pro")
    }
}
