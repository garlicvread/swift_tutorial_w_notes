//
//  ImageView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/07.
//

import Foundation

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("dots")
            // .resizable(): Image 크기를 조정하기 위한 modifier
            .resizable()
        
            // // .aspectRatio(): 이미지 비율 유지
            //.aspectRatio(contentMode: .fill)
        
            // .aspectRatio(contentMode: .fit): 한 축을 따라 보기 크기에 맞게 이미지 스케일링
            .aspectRatio(contentMode: .fit)
            .border(Color.red)
        
            //.frame(): 이미지 크기 조절자
            .frame(width: 300, height: 200)
        
            // 프로필 이미지 원형으로 변경
            // shape type: Capsule, Circle, Ellipse, Rectangle, RoundedRectangle 가능
            .clipShape(Circle())
        
            // 외곽선. clipShape과 다른 shape type을 지정하면 와꾸 깨질 수 있음.
            // stroke의 색상과 lineWidth 지정 가능
            .overlay(Circle().stroke(Color.green, lineWidth: 4))
        
        
        // SF symbol 사용시
        // SF symbol 예시: person, person.circle 등
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 100)
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .previewDevice("iPhone 13 Pro")
    }
}
