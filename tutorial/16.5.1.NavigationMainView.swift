//
//  16.5.1.NavigationMainView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// 16.5.1.NavigationData.swift에 array를 생성했으므로 MainView에 NavigationView를 만든다.
struct AnimalNavigationMainView: View {
    
    var animals: [Animal] = animalsData
    
    var body: some View {
        NavigationView {
            
            // animal은 위에 작성한 animalsData 라는 array에서 받아온다.
            List(animals) { animal in
                
                // 이 항목은 View의 대략적 형태를 작성한 이후 작성하는 항목임. 근데 뭐 그냥 왔다리갔다리 하면서 봐도 될 것 같다.
                // 항목 클릭시 세부 페이지로 넘어갈 수 있도록 NavigationLink() {} 를 추가한다.
                // NavigationLink() {}의 {} 내부에는 사용자가 보게 될 view를 넣는다.
                // 즉, 아까 작성한 AnimalListView(animal: animal) 항목을 여기로 이동시킨다.
                // () 내부에는 destination, 즉 항목을 눌렀을 때 이동하는 View를 작성해야 한다.
                // 여기서는 AnimalsDetailView(animal: animal)을 destination으로 정의한다.
                // AnimalsDetailView(animal: animal)는 아직 안 만들었으므로 아래쪽으로 내려가서 만들자.
                NavigationLink(destination: AnimalsDetailView(animal: animal)) {
                    // animalsData array에서 받아온 Animal 데이터를 보여주기 위한 View struct를 작성한다.
                    // AnimalListView에서 사용할 animal의 값에 animal을 넘겨준다.
                    // 이렇게 데이터를 받아오려면 animalsData array의 데이터를 받아올 변수를 위에 선언해야 한다.
                    // 여기서는 var animal: Animal로 선언했다.
                    AnimalListView(animal: animal)
                }
            }
            .navigationBarTitle("애니멀!")
        }
    }
}

struct AnimalNavigationMainView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalNavigationMainView()
            .previewDevice("iPhone 13 Pro")
    }
}
