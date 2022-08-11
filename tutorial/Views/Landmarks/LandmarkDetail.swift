//
//  LandmarkDetail.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

// MainContentView.swift 파일의 안내에 따라 왔다면 주석 1.6.10의 내용을 확인한 후 CircleImage.swift 파일로 이동하자.

import SwiftUI

struct LandmarkDetail: View {
    // 2.7.6. Landmark 프로퍼티 추가. 프리뷰 코드로 이동 ⬇️
    var landmark: Landmark

    var body: some View {

        // 2.6.2. MainContentView 코드를 복붙해옴
        // 이제 MainContentView의 내용을 변경하러 가자

        // 1.6.2. 기존 VStack을 감쌀 새 VStack 삽입
//        VStack {
        ScrollView {  // 2.7.9. VStack -> ScrollView로 변경
            // 1.6.3. MapView 가져오기, 1.6.4. 리이브 프리뷰로 확인
            MapView(coordinate: landmark.locationCoordinates)  // 2.7.8. 필요한 데이터 추가
                .ignoresSafeArea(edges: .top)  // 1.6.8. safe area 무시 옵션 추가
                .frame(height: 300)

            CircleImage(image: landmark.image)  // 1.6.5. CircleImage 뷰 추가, 2.7.8. 필요한 데이터 추가
                .offset(y: -130)  // 1.6.6. y축 offset 값 -130으로 설정 -> MapView 위에 CircleImage를 겹쳐 표시
                .padding(.bottom, -130)  // 1.6.6. 하단 padding값도 -130으로 설정 -> 아래 텍스트 뷰와의 거리 조절

            // 1.3.1., 1.3.2. VStack 추가
            VStack(alignment: .leading) {  // 1.3.5. alignment 옵션 추가
                Text(landmark.name)  // 2.7.8. 필요한 데이터 추가
                    .font(.title)

                // 1.3.6. HStack 추가
                HStack {
                    Text(landmark.park)  // 1.3.3. TextView의 placeholder 변경, // 2.7.8. 필요한 데이터 추가
//                        .font(.subheadline)  // 1.3.4. 폰트 변경

                    Spacer()  // 1.3.8. Spacer 추가

                    Text(landmark.state)  // 1.3.7. TextView 추가, // 2.7.8. 필요한 데이터 추가
//                        .font(.subheadline)
                }
                .font(.subheadline)  // 1.6.10. 폰트 설정 이동
                .foregroundColor(.secondary)  // 1.6.10. 폰트 색상 변경

                Divider()  // 1.6.9. divider 및 기타 정보를 표시하는 Text 추가

                Text("About \(landmark.name)")  // 2.7.8. 필요한 데이터 추가
                    .font(.title2)

                Text(landmark.description)  // 2.7.8. 필요한 데이터 추가
            }
            .padding()  // 1.3.9. 패딩 추가

//            Spacer()  // 1.6.7. Spacer 추가 -> 전체 오브젝트를 화면 상단으로 배치
        }
        // 2.7.10. navigationTitle(_:) 메서드 호출
        .navigationTitle(landmark.name)
        // 2.7.10. navigationBarTitleDisplayMode(_:) 메서드 호출 -> inline 형태로 나타나도록 옵션 추가
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        // 2.7.6. ⬆️ 에서 선언한 Landmark 프로퍼티 추가
        // 3.5.3. landmarks[0] 대신 ModelData().landmarks[0] 사용
        // 3.5.3. 까지 이동했으면 LandmarkRow.swift 파일로 이동
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}

// 2.7.6. 까지 따라왔으면 LandmarkList.swift 파일로 이동
// 2.7.10. 까지 따라왔으면 LandmarkList.swift 파일로 이동
