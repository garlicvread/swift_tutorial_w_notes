//
//  17.TabView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// 그냥 메인 뷰 하나만 있으면 심심하니까 16.5.NavigationView_applied에서 만들어 둔 하트에 뭔가를 해 보자.
// 예컨대 하트를 누른 동물만을 리스트로 보여주는 탭을 만들어 보자. 어차피 탭 뷰 연습이라 항목을 하나 더 만들기는 해야 함.
struct AnimalLikedView: View {
    
    // 변수 animals 선언. 이 변수를 통해 AnimalLikedView 내부에서 animalsData의 값을 사용한다.
    var animals: [Animal] = animalsData
    
    var body: some View {
        
        // NavigationView를 사용한 것은 NavigationTitle을 지정해 주기 위한 것이다.
        // 타이틀이 필요 없으면 다른 View를 사용하거나, 아예 생략해도 무방함.
        NavigationView {
            
            // 하트를 누른 동물인지 아닌지 필터링.
            // .filter는 고차함수(higher-order function)의 일종으로, 고차함수는 하나 이상의 다른 함수를 인자(parameter)로 취하거나 연산 결과를 어떤 특정한 값이 아니라 함수로 반환해 주는 함수를 말한다. 흔히 말하는 익명함수(람다함수)가 고차함수의 대표적 예시이다.
            // 여기서 $0은 보통 첫 번째 인자(parameter)를 의미한다. 두 번째 인자는 $1, 세 번째 인자는 $2와 같이 쓴다.
            // 그럼 왜 첫 번째 인자에 필터링을 했는가? 설명이 길어지지만 차근차근 설명해 보자면
            // 필터를 거는 대상은 animals 라는 변수이다. 이 animals 라는 변수에는 animalsData라는 array의 데이터가 담겨 있다. (라인 34)
            // animalsData라는 array는 지금 이 코드가 아니라 16.5.NavigationView_applied 코드로 가서 봐야 한다.
            // 16.5.NavigationView_applied 라인 25에 animalsData라는 변수를 선언해 놓았고,
            // 이 변수에는 같은 문서 라인 13에서 정의한 Animal이라는 struct(구조체)에 따라 작성된 데이터가 담긴다.
            // 이때 Animal struct의 첫 번째 항목($0)이 바로 ID인데, ID는 ID = UUDI() 코드를 통해 중복되지 않는 고윳값을 갖는다.
            // 그래서 이 ID를 기준으로 해서 같은 항목의 isLike 값을 검색했을 때 true인 경우 List에 담아 보여주는 것이다.
            // 굳이 ID에 고윳값을 지정하고 그 값을 기준으로 검색하는 이유는 사용자가 복수일 경우를 가정한 것이다.
            // 내가 하트를 누른 동물을 List로 보고 싶은 것이지 다른 사람이 하트를 누른 동물을 보고 싶은 것이 아니기 때문이다.
            List(animals.filter{$0.isLike == true}) { animal in
                HStack {
                    AnimalListView(animal: animal)
                    
                    Spacer()
                    
                    // 원래 이 버튼은 좋아요/좋아요 취소 기능이 들어가야 하는데, 안타깝게 예제 코드는 그 기능을 구현하지 않았다.
                    Button(
                        action: {},
                        label: {
                            Image(systemName: animal.isLike ? "heart.fill" : "heart")
                        }
                    )
                }
            }
            .navigationTitle("Liked Animals")
        }
    }
}


struct AnimalLikedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalLikedView()
            .previewDevice("iPhone 13 Pro")
    }
}
