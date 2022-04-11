//
//  09.PickerCustom.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/10.
//

import Foundation

import SwiftUI

struct PickerView_2: View {
    @State private var selectedFlavor = Flavor_2.Chocolate
    
    var body: some View {
        Menu {
            // Menu 아래 영역에 Picker를 넣는다.
            Picker(selection: $selectedFlavor, label: EmptyView()) {
                Text("Chocolate").tag(Flavor_2.Chocolate)
                Text("Vanilla").tag(Flavor_2.Vanilla)
                Text("Strawberry").tag(Flavor_2.Strawberry)
                Text("MintChocolate").tag(Flavor_2.MintChocolate)
            }
        } label: {
            // 이 Picker의 모양을 다음과 같이 지정하면 Picker의 모양을 커스텀할 수 있다.
            HStack(spacing:5){
                Text(selectedFlavor.rawValue)
                    .font(.system(size:30, weight: .bold, design: .rounded))
                Image(systemName: "chevron.down")
                    .font(.system(size:20, weight: .medium, design: .rounded))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
        }
        
        
// //        Form의 형태로 Picker를 만들 수도 있다.
//        NavigationView {
//            Form {
//                Section {
//                    Picker("Flavor", selection: $selectedFlavor) {
//                        Text("Chocolate").tag(Flavor_2.Chocolate)
//                        Text("Vanilla").tag(Flavor_2.Vanilla)
//                        Text("Strawberry").tag(Flavor_2.Strawberry)
//                        Text("MintChocolate").tag(Flavor_2.MintChocolate)
//                    }
//                }
//            }
//        }
    }
}

enum Flavor_2 : String {
    case Chocolate = "Chocolate"
    case Vanilla = "Vanilla"
    case Strawberry = "Strawberry"
    case MintChocolate = "Mint Chocolate"
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView_2()
            .previewDevice("iPhone 13 Pro")
    }
}
