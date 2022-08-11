//
//  LandmarkRow.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct LandmarkRow: View {
    // 2.2.3. Stored property landmark 선언
    var landmark: Landmark

    var body: some View {
        HStack {  // 2.2.5. TextView를 HStack 내부로 이동
            landmark.image  // 2.2.6. HStack 완성
                .resizable()
                .frame(width: 50, height: 50)

            Text(landmark.name)  // landmark 프로퍼티 내 name 항목 사용하도록 TextView 변경

            Spacer()  // 2.2.6. HStack 완성
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {  // 2.3.4. 코드를 간단히 줄이려면 group으로 Preview를 묶은 방법도 있음
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
//        LandmarkRow(landmark: landmarks[0])  // 2.2.4. LandmarkRow 구조체 내에 정의된 parameter 추가 -> landmarks 배열의 요소 특정
//            .previewLayout(.fixed(width: 300, height: 70))  // 2.3.2. .previewLayout 메서드를 사용하면 static preview의 사이즈를 조절할 수 있음
//
//        LandmarkRow(landmark: landmarks[1])  // 2.3.3. preview를 여러 개 추가할 수 있다
            .previewLayout(.fixed(width: 300, height: 70))
    }
}


// 여기까지 마쳤다면 LandmarkList.swift 파일을 생성하자.
// 해당 파일은 SwiftUIView 파일이다.
