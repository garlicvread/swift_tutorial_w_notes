//
//  ForEach.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/11.
//

import Foundation

import SwiftUI

struct ForEachView: View {
    let imageList = ["airplayaudio", "airplayvideo", "airpods", "airpodspro", "applelogo"]
    
    var body: some View {
        VStack(spacing: 10) {
//            ForEach(0 ..< 5) { index in
//                Image(systemName: imageList[index])
//                    .padding(10)
//                    .foregroundColor(.yellow)
//                    .font(.largeTitle)
//            }
            
            ForEach(imageList, id: \.self) { index in
                // id: \.self : 배열 내 element 식별을 위한 코드
                // index in 대신 $0을 사용하기도 함.
                // $0: 첫 번째 요소. 즉 ForEach문을 반복할 때마다 첫번째 요소를 가져온다. --> array의 요소를 차례대로 가져오게 됨.
                Image(systemName: index)
                    .padding(10)
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
        }
    }
}

struct ForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachView()
            .previewDevice("iPhone 13 Pro")
    }
}
