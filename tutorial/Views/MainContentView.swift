//
//  MainContentView.swift
//  tutorial
//
//  Created by 김제필 on 8/10/22.
//

import Foundation
import SwiftUI

// View 프로토콜 렌더링을 위한 구조체(Structure)
// 2.6.3 작업으로 인해 원래 있던 내용이 LandmarkDetail.swift 파일로 이동되었다.
// 1.5. Use SwiftUI Views From Other Frameworks 섹션 다음 작업을 위해 이 파일로 왔다면 LandmarkDerail.swift 파일로 가보자.
struct MainContentView: View {
    var body: some View {
        LandmarkList()  // 2.6.3. 기존 내용을 LandmarkDetail.swift로 옮기고 LandmarkList를 불러옴
        // 2.6.3. 항목 이후 LandmarkList.swift 파일로 이동

    }
}


struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
