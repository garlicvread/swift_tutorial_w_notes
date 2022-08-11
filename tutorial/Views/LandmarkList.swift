//
//  LandmarkList.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {  // 2.4.2. List 객체 내부에 LandmarkRow 인스턴스를 배치한다
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
