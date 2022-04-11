//
//  07.ToggleAndPicker.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/10.
//

import Foundation

import SwiftUI


// Toggle: on <--> off 상태에 따라 다른 결과를 보여주는 control.
// 보통 on/off 구분을 위해 boolean 값을 갖는 변수를 정의하여 사용함.
struct ToggleView: View {
    
    // isOn: Toggle이 켜져 있는지 여부를 나타내는 Boolean 값이 들어감.
    // Bool 값을 아래 $isToggle에 넘기기 위해 @State 를 변수 앞에 붙인다.
    @State private var isToggle = false
    
    var body: some View {
        VStack {
            Text("Dark Mode")
                .font(.largeTitle)
                .foregroundColor(.pink)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.pink, lineWidth: 5)
                )

// //            Toggle 값 변화에 따라 이미지/텍스트 값 변경을 위해 코드 수정.
// //            기존 코드(이 바로 아래 코드)는 주석처리
//            Image("Light Mode")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 400, height: 300)
            
            Image(isToggle ? "dark_mode" : "light_mode")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 300)
            
            // Toggle: Toggle()의 형태로 사용함.
            // Label 부분과 isOn 부분으로 구성된다.
            Toggle("Label", isOn: $isToggle)
            // $isToggle: @State private var isToggle = false의 isToggle의 값을 받아옴.
            // Label: 토글 상태를 보여주는 텍스트 입력
            
            // label이 속성 변경 없이 텍스트로만 되어있는 경우 ()안에 isOn을 첫번째 파라미터로 넣고 label을 그 아래 집어넣sms 방식도 사용할 수 있다.
            Toggle(isOn: $isToggle) {
                Text("Second Label")
            }
            
            // Label을 숨기고 싶으면 .labelsHidden()을 사용할 수 있음. 이러면 토글 버튼만 나온다.
            Toggle("Label", isOn: $isToggle)
                .labelsHidden()
            
            // Label을 토글 버튼 우측으로 이동하거나 하는 등 커스텀을 하고 싶으면 여러 가지 시도해 볼 것.
            HStack {
                Toggle("Third Label", isOn: $isToggle)
                    .labelsHidden()
                    // toggle 스타일은 기본적으로 Switch, Button 두 가지이나 커스텀해서 사용할 수도 있음.
                    // 링크 참조: https://developer.apple.com/documentation/swiftui/togglestyle
                    .toggleStyle(SwitchToggleStyle(tint: .purple))
                
                
// //            Toggle 값 변화에 따라 이미지/텍스트 값 변경을 위해 코드 수정.
// //            기존 코드(이 바로 아래 코드)는 주석처리
//                Text("Label Off")
//                    .font(.title)
//                    .padding()
//                    .foregroundColor(.pink)
                
                Text(isToggle ? "ON" : "OFF")
                    .font(.title)
                    .padding()
                    .foregroundColor(.teal)
            }
        }
    }
}


struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
            .previewDevice("iPhone 13 Pro")
    }
}
