//
//  tutorialApp.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import SwiftUI

@main
struct tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            // 원래 이 아래에는 ContentView()가 지정돼 있었을 것이다.
            // 하지만 나는 이 파일을 수정하지 않고, 다른 파일에 연결하기 위해 MainContentView()를 불러오도록 변경하였다.
            // MainContentView 파일로 가보자.
            MainContentView()
        }
    }
}
