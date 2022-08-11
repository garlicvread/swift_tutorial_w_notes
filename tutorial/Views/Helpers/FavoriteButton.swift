//
//  FavoriteButton.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct FavoriteButton: View {
    // 3.6.2. 버튼의 현재 상태를 저장할 변수 isSet을 선언하고 @Binding 프로퍼티 래퍼를 추가한다. ⬇️
    @Binding var isSet: Bool

    var body: some View {
        // 3.6.3. 버튼 생성 -> 기본 형태 지정
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        // 3.6.2. ⬆️ 변수 isSet을 프리뷰에 추가한다.
        FavoriteButton(isSet: .constant(true))
    }
}


// 3.6.3. 까지 도달했으면 LandmarkDetail.swift 파일로 이동
