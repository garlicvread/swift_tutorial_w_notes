//
//  08.Picker.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/10.
//

import Foundation

import SwiftUI

struct PickerView_1: View {
    // selectedFlavor의 초기값으로 Flavor.chocolate를 지정. 다른 거 지정해도 된다.
    @State private var selectedFlavor = Flavor_1.Chocolate
    
    var body: some View {
        VStack {
            // Picker는 Picker() {} 형태로 사용한다.
            // Picker의 값에는 label, binding, 선택할 수 있는 값이 있다.
            // () 안에 label, binding 값을 입력
            Picker("Flavor", selection: $selectedFlavor) {
                // {} 안에 Picker로 선택할 수 있는 값을 넣는다. 하단 enum Flavor {} 참조.
                // .tag은 각각의 맛을 구분하기 위해 붙여준 것이다.
                Text("Chocolate").tag(Flavor_1.Chocolate)
                Text("Vanilla").tag(Flavor_1.Vanilla)
                Text("Strawberry").tag(Flavor_1.Strawberry)
                Text("MintChocolate").tag(Flavor_1.MintChocolate)
            }
            
            // Picker의 스타일 지정: wheel, menu, automatic, inline, segmented의 다섯 종류가 있다.
//            .pickerStyle(.wheel)
//            .pickerStyle(.menu)
//            .pickerStyle(.automatic)
            .pickerStyle(.inline)
//            .pickerStyle(.segmented)
            
            // \(selectedFlavor.rawValue) : 선택된 맛의 raw data
            Text("Flavor Picked: \(selectedFlavor.rawValue)")
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

// enum(열거형)으로 선택할 수 있는 값들을 case로 선언
// 각 case의 raw data 타입이 문자열이므로 데이터 타입을 String으로 지정
enum Flavor_1 : String {
    case Chocolate = "Chocolate"
    case Vanilla = "Vanilla"
    case Strawberry = "Strawberry"
    case MintChocolate = "Mint Chocolate"
}

struct PickerView_previews: PreviewProvider {
    static var previews: some View {
        PickerView_1()
            .previewDevice("iPhone 13 Pro")
    }
}
