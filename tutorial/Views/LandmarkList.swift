//
//  LandmarkList.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List {  // 2.4.2. List 객체 내부에 LandmarkRow 인스턴스를 배치한다
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }

        // MARK: 데이터를 identifiable 하게 만드는 방법 두 가지
        //  첫째, 각 요소를 고유하게 식별하도록 하는 키 경로를 갖고 오는 방법.
        //  둘째, 데이터 형식이 identifiable 프로토콜을 따르도록 만드는 방법.

//        // 여기서는 첫 번째 방식으로 코딩
//        List(landmarks, id: \.id) { landmark in  // 2.5.1. 하드코딩된 리스트 제거, landmarks 배열의 값을 가져옴
//            // List는 indentifialble 데이터에 한해 작동한다.
//
//            LandmarkRow(landmark: landmark)  // 2.5.2. Closure에서 LndmarkRow를 반환함으로써 동적으로 리스트 생성
//            // 2.5.2. 항목까지 따라왔으면 이제 Landmark.swift 파일로 가 보자
//        }

        // 2.6.4. List를 NavigationView 안으로 재배치
        NavigationView {
            // 2.5.4. 두 번째 방식 코딩: 코드가 더 간결해짐
            List(landmarks) { landmark in
                NavigationLink {  // 2.6.6. NavigationLink 내 반환되는 row를 래핑하고 목적지를 LandmarkDetail로 명시
                    LandmarkDetail(landmark: landmark)  // 2.7.7. 현재 landmark 값을 목적지인 LandmarkDetail로 넘김
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")  // 2.6.5. navigationTitle(_ :) modifier 메서드 호출
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

// 2.6.6. 항목까지 따라왔으면 이제 CircleImage.swift로 이동한다
