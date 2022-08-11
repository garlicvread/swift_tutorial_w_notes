//
//  tutorialApp.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import SwiftUI

@main
struct tutorialApp: App {
    // 3.5.6. ModelData 객체를 사용하도록 model instance 작성 ⬇️
    // @StateObject는 ObservableObject를 객체화하는 프로퍼티 래퍼이다.
    // StateObject 프로퍼티가 붙으면 하나의 객체가 되고, View가 초기화되든 말든 별도의 객체로 관리된다.
    // 즉, 초기화를 딱 한 번만 실행한다.
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            // 원래 이 아래에는 ContentView()가 지정돼 있었을 것이다.
            // 하지만 나는 이 파일을 수정하지 않고, 다른 파일에 연결하기 위해 MainContentView()를 불러오도록 변경하였다.
            // MainContentView 파일로 가보자.
            MainContentView()

                // 3.5.6. ⬆️ 여기도 마찬가지로 ModelData 객체를 사용하도록 model instance 작성
                .environmentObject(modelData)
        }
    }
}

// 3.5.6. 까지 왔으면 LandmarkList.swift 파일로 이동해서 라이브 프리뷰를 실행해 보고, FavoriteButton.swift 파일을 생성하자.
