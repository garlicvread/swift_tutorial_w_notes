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

            if landmark.isFavorite {  // 3.1.4. 조건에 따라 별 이미지를 삽입
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)  // 3.1.5. 별 이미지 색상 변경
                // 3.1.5. 까지 진행했으면 LandmarkList.swift 파일로 갈 것
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    // 3.5.4. 프리뷰에서 ModelData 객체를 사용하도록 지정
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {  // 2.3.4. 코드를 간단히 줄이려면 group으로 Preview를 묶은 방법도 있음
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
//        LandmarkRow(landmark: landmarks[0])  // 2.2.4. LandmarkRow 구조체 내에 정의된 parameter 추가 -> landmarks 배열의 요소 특정
//            .previewLayout(.fixed(width: 300, height: 70))  // 2.3.2. .previewLayout 메서드를 사용하면 static preview의 사이즈를 조절할 수 있음
//
////        LandmarkRow(landmark: landmarks[1])  // 2.3.3. preview를 여러 개 추가할 수 있다
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

// 2.3.4. 까지 마쳤다면 LandmarkList.swift 파일을 생성하자.
