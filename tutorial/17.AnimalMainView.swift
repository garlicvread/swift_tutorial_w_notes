//
//  17.TabView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// 기본적으로 16.NavigationView, 16.5.NavigationView_applied, 특히 후자에서 짠 코드를 우려먹는 코드임.
// 쭉 보다가 이해가 안 가는데 설명이 없는 부분이 있다면 비슷하게 생긴 코드가 상기 두 코드에 설명이 있을 확률이 높음.

// 17번은 총 세 파일로 구성된다.
// 17.AnimalMainView.swift, 17.AnimalTabView.swift, 17.AnimalLikedView.swift의 세 파일이다.
// 여기에 16.5.NavigationView_applied.swift를 불러와서 써먹는 데이터가 있으니 실은 네 개 파일로 구성된 앱이라 보면 된다.
// 약간 정신이 없을 수 있으나 잘 따라가 보시길 바란다.
// 원래는 이 세 파일을 따로 앱으로 빌드했어야 하는데 귀찮아서 패스했다. 그렇게 싹 다 귀찮아서 넘어간 게 이 꼴이 난 원인이긴 한데 ㅋ
// 시뮬레이터에서 보는 데는 아무 지장이 없으니 프리뷰나 시뮬레이터를 활용해 보시길...

// 가장 기본 틀이 되는 Main View를 만들어야 한다. 만들어 주자.
struct AnimalMainView_Tab: View {
    
    // animalsData는 16.5.NavigationView_applied의 라인 25에 있는 array를 불러온 것이다.
    // refactoring 이후 좀 바뀌었는데, 16.5.1.NavigationData.swift의 라인 20을 보시라.
    var animals: [Animal] = animalsData
    
    var body: some View {
        NavigationView {
            List(animals) { animal in
                NavigationLink(destination: AnimalsDetailView(animal: animal)) {
                    AnimalListView(animal: animal)
                }
            }
            .navigationBarTitle("애니멀!")
        }
    }
}


struct AnimalMainView_Tab_Previews: PreviewProvider {
    static var previews: some View {
        AnimalMainView_Tab()
            .previewDevice("iPhone 13 Pro")
    }
}
