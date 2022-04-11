//
//  ButtonView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/07.
//


// Button: 클릭되었을 때 action 작업을 수행하는 control.
// Button은 action부분과 label부분으로 구성됨.
// action: Button을 클릭했을 때의 수행되는 작업.
// label: 사용자에게 보이는 Button의 UI.

import Foundation

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {
            //action: Button 클릭시 실행되는 코드
            print("Button Clicked")
        }) {
            // label: 버튼의 UI
            // label 내부 코드를 변경하면 버튼 모양을 변경할 수 있음.
            // HStack: Text와 Image를 가로 배치
            // HStack에 지정한 modifier는 HStack 내부 모든 View에 영향을 줌.
            HStack {
                Text("Log In")
                
                Image(systemName: "arrow.right.circle")
            }
//            .font(.system(size: 30, weight: .bold, design: .rounded))
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.pink)
//
//            // 배경도 Capsule모양으로 만들어줘야 테두리와 일치하게 됨.
//            .clipShape(Capsule())
//
//            // 테두리: Capsule 모양으로 생성
//            .overlay(Capsule().stroke(Color.pink, lineWidth: 3))
        }
        // .buttonStyle()을 Button에 사용 --> button style 지정
        .buttonStyle(MyButtonStyle())
    }
}

// 버튼 스타일을 만들어서 모든 버튼의 스타일 유지/보수의 용이성 도모
struct MyButtonStyle: ButtonStyle {
    // makeBody 함수로 Button에 어떤 속성을 붙일지 결정: func makeBody() -> some View{} 선언
    // configuration: 버튼의 속성 부여
    func makeBody(configuration: Self.Configuration) -> some View {
        // configuration.label의 modifier --> 버튼에 적용되는 modifiers
        configuration.label
            // 위에 만들어 놓은 버튼의 modifier를 configuration.label에 붙이고, 원 코드는 주석처리
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding()
            .background(Color.pink)
            
            // 배경도 Capsule모양으로 만들어줘야 테두리와 일치하게 됨.
            .clipShape(Capsule())
            
            // 테두리: Capsule 모양으로 생성
            .overlay(Capsule().stroke(Color.pink, lineWidth: 3))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewDevice("iPhone 13 Pro")
    }
}

