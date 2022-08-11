//
//  LandmarkDetail.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

// MainContentView.swift 파일의 안내에 따라 왔다면 주석 1.6.10의 내용을 확인한 후 CircleImage.swift 파일로 이동하자.

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {

        // 2.6.2. MainContentView 코드를 복붙해옴
        // 이제 MainContentView의 내용을 변경하러 가자

        // 1.6.2. 기존 VStack을 감쌀 새 VStack 삽입
        VStack {
            // 1.6.3. MapView 가져오기, 1.6.4. 리이브 프리뷰로 확인
            MapView()
                .ignoresSafeArea(edges: .top)  // 1.6.8. safe area 무시 옵션 추가
                .frame(height: 300)

            CircleImage()  // 1.6.5. CircleImage 뷰 추가
                .offset(y: -130)  // 1.6.6. y축 offset 값 -130으로 설정 -> MapView 위에 CircleImage를 겹쳐 표시
                .padding(.bottom, -130)  // 1.6.6. 하단 padding값도 -130으로 설정 -> 아래 텍스트 뷰와의 거리 조절

            // 1.3.1., 1.3.2. VStack 추가
            VStack(alignment: .leading) {  // 1.3.5. alignment 옵션 추가
                Text("Turtle Rock")
                    .font(.title)

                // 1.3.6. HStack 추가
                HStack {
                    Text("Joshua Tree National Park")  // 1.3.3. TextView의 placeholder 변경
//                        .font(.subheadline)  // 1.3.4. 폰트 변경

                    Spacer()  // 1.3.8. Spacer 추가

                    Text("California")  // 1.3.7. TextView 추가
//                        .font(.subheadline)
                }
                .font(.subheadline)  // 1.6.10. 폰트 설정 이동
                .foregroundColor(.secondary)  // 1.6.10. 폰트 색상 변경

                Divider()  // 1.6.9. divider 및 기타 정보를 표시하는 Text 추가

                Text("About Turtle Rock")
                    .font(.title2)

                Text("Descriptive text goes here.")
            }
            .padding()  // 1.3.9. 패딩 추가

            Spacer()  // 1.6.7. Spacer 추가 -> 전체 오브젝트를 화면 상단으로 배치
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
