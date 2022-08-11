//
//  CircleImage.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image  // 2.7.1. 저장된 이미지 프로퍼티 추가 -> 오류 추후 수정

    var body: some View {
//        Image("turtlerock")  // 1.4.3. TextView -> Image initializer로 변경
        image  // 2.7.1. ⬆️ 커스텀 뷰로 여러 modifier를 래핑하여 캡슐화하는 방식
            .clipShape(Circle())  // 1.4.4. 이미지 원형으로 잘라내기(마스크 추가)
            .overlay {  // 1.4.5. 회색 테두리 원 생성 후 overlay에 추가
                Circle().stroke(.white, lineWidth: 4)  // 1.4.7. 테두리 흰색으로 변경
            }
            .shadow(radius: 7)  // 1.4.6. 그림자 효과 추가
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))  // 2.7.2. PreviewProvider에서 turtlerock 이미지를 보여주도록 데이터를 넘긴다.
    }
}

// 주석 1.4.7.까지 따라왔다면 MapView.swift 파일로 이동하자.
// 주석 2.7.2.까지 따라왔다면 MapView.swift 파일로 이동하자.
