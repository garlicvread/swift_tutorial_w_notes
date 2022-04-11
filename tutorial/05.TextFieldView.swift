//
//  TextFieldView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/08.
//

import Foundation


import SwiftUI

struct TextFieldView: View {
    // 입력된 값을 저장하기 위한 name 변수 선언
    // = 오른쪽에 빈 값("")을 넣으면 TextField에 아무런 값도 들어있지 않은 상태로 실행됨.
    // 값을 넣으면 당연히 그 값이 입력된 상태로 실행됨
    // @State: name 변수값 변경시 View를 새로 만들고, name 변수가 사용된 모든 곳에 변경된 값을 적용하기 위한 것
    @State private var name: String = ""

    var body: some View {
        VStack {
            // TextField 선언.
            // () 내부 값 --> Text에 출력됨

            // "What's your name?" : placeholder. 사용자가 입력할 데이터의 힌트를 넣어주는 것이 좋음.
            // Text: $name ==> TextField에 입력한 값이 name 변수의 값이 되도록 지정
            // $: 바인딩. name 변수의 양방향 통신을 위한 것
            TextField("What's your name?", text: $name)
//                .textFieldStyle(.automatic)
//                .textFieldStyle(.plain)
                .textFieldStyle(.roundedBorder)
                .padding()

            // Text 선언. TextField의 입력값에 따라 Text값이 실시간으로 변화
            Text("Hello \(name)")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.pink)
        }
    }
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
            .previewDevice("iPhone 13 Pro")
    }
}
