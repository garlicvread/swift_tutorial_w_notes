//
//  textView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/07.
//

import Foundation

import SwiftUI

struct textView: View {
    var body: some View {
        Text("Hello World!")
        // 어쩌구저쩌구.어쩌구저쩌구 에서 . 의 의미는 ~의 정도로 이해하고 넘어갈 것. 이렇게 이해하면 안 되지만, 지금은 그 정도로 이해하고 넘어가도 좋다.
        // 예컨대 아래 코드에서 .font()는 Text 항목 아래에 있으니 Text의 font, 이런 식으로 이해하면 편할 것이다.
            .font(.system(size: 50, weight: .light, design: .serif))
            .foregroundColor(.pink)
        
        // .frame과 .background의 순서에 따라 화면에 다른 형태의 결과물이 출력됨.
        // 아래 코드와 비교ㄱㄱ
            .background(Color.yellow)
            .frame(width: 200, height: 200)
            .border(.red, width: 5)
        
        Text("Hello World!")
            .font(.system(size: 50, weight: .light, design: .serif))
            .foregroundColor(.pink)
        
            .frame(width: 200, height: 200)
            .background(Color.yellow)
            .border(.red, width: 5)

    }
}

struct textView_Previews: PreviewProvider {
    static var previews: some View {
        textView()
            .previewDevice("iPhone 13 Pro")
    }
}
