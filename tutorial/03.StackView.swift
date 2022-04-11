//
//  StackView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/07.
//

import Foundation

import SwiftUI

struct StackView: View {
    var body: some View {
        // alignment: .leading: 좌측 정렬, .trailing: 우측 정렬
        // .spacing: 하위 view 간 간격
        VStack(alignment: .trailing, spacing: 30) {
            Text("Hello")
                .background(Color.yellow)
            Text("SwiftUI")
                .background(Color.green)
        }
        .font(.system(size: 50))
        .foregroundColor(.black)
        
        HStack(alignment: .bottom, spacing: 50) {
            Text("Youth")
                .background(Color.mint)
            Text("Everyone")
                .background(Color.gray)
            }
        .font(.system(size: 50))
        .foregroundColor(.red)
        
        // 이미지가 가장 하위에 위치해야 하므로 ZStack{} 내부에 Image를 넣음
        ZStack {
            Image("500500")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // EditButton()이 Image보다 더 위의 레이어에 위치해야 버튼을 누를 수 있으므로 Image 코드보다 아래쪽에 입력함.
            EditButton()
        }
        // Image의 크기를 프로필 크기에 맞게 조절하기 위해 .frame(width:300, height: 300) 작성
        .frame(width: 300, height: 300)
        
        // Image를 원형으로 잘라낸다.
        .clipShape(Circle())
    }
}

// 새로운 View Struct 생성: EditButton
struct EditButton: View {
    var body: some View {
        VStack {
            Spacer()
            
            // ZStack으로 Rectangle(), Text()를 감싸서 두 개체를 Z축 방향으로 겹친다.
            ZStack {
                Rectangle()
                    .fill(Color.black).opacity(0.6)
                    .frame(width: 300, height: 70)
                
                Text("Edit")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
            .previewDevice("iPhone 13 Pro")
    }
}
