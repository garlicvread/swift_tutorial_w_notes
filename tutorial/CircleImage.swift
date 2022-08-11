//
//  CircleImage.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")  // 4.3. TextView -> Image initializer로 변경
            .clipShape(Circle())  // 4.4. 이미지 원형으로 잘라내기(마스크 추가)
            .overlay {  // 4.5. 회색 테두리 원 생성 후 overlay에 추가
                Circle().stroke(.white, lineWidth: 4)  // 4.7. 테두리 흰색으로 변경
            }
            .shadow(radius: 7)  // 4.6. 그림자 효과 추가
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
