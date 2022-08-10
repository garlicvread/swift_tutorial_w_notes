//
//  ContentView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

// 프로젝트를 생성하면 ContentView.swift 파일이 생성된다.
// ContentView는 프로그램 실행시 최초로 보는 화면으로 설정되어 있다.
// tutorialApp.swift 파일을 열어보자.

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
