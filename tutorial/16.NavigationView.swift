//
//  16.NavigationView.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/12.
//

import Foundation

import SwiftUI

// main 화면 --> sub 화면 전환하는 뷰
// NavigationView는 SwiftUI의 가장 중요한 구성요소 중 하나로, 메인 --> 서브 화면 간 계층적 탐색이 가능하게 만들어준다.
struct NavigationMainView: View {
    var body: some View {
        
        // 먼저 0 ~ 5 가 적힌 List를 하나 만들어서 여기 집어넣은 것.
        NavigationView {
            
            // 1 ~ 5까지의 숫자가 적힌 List를 하나 만든다. 이 리스트를 다시 NavigationView {} 안에 집어넣는다.
            List (0 ..< 5) { num in
                
                // List 각 항목에 서브 화면으로의 전환이 가능한 링크를 만든다.
                // NavigationLink(destination: ) {}의 {} 안에 각 링크에 해당하는 View를 삽입하면 된다.
                // 서브 화면에 해당하는 항목은 아래 NavigationDetailView 라는 View를 참조하자.
                NavigationLink(destination: NavigationDetailView(num: num)) {
                    Text("List \(num + 1)")
                    // 이건 어떻게 해석하냐면, 큰따옴표 쌍 "" 내부의 글자를 Text 요소로 인식해서 출력을 할 건데, 0, 1, 2, 3, 4에다 1을 더한 값, 즉 num + 1 을 계산해서 출력한다는 뜻이다.
                    // num + 1을 소괄호 () 로 감싼 이유는 num + 1 연산을 할 때 num 값을 외부에서 받아올 수 있게 만들어주기 위해서이다.
                    // 소괄호가 없으면 \n을 개행(줄바꿈) 문자로 인식해 버리기 때문에 그 부분에서 줄바꿈이 일어나고 그 다음 um + 1만 출력한다. * 이건 Swift만의 문법이므로 다른 데서 이렇게 쓰면 안 됨.
                }
            }
            // .navigationBarTitle 이라는 modifier로 Navigation Bar의 타이틀을 정한다.
            .navigationBarTitle("네비게이션 뷰")
        }
        // NavigationView 에 스타일 지정하기
        // ipad나 mac의 앱에서 사용되는 NavigationView는 기본적으로 사이드바가 존재하는 Double column 형식이다.
        // 사이드바가 없는 Stack 스타일의 NavigationView를 만들고 싶으면 .navigationViewStyle() 의 () 안에 StackNavigationViewStyle() 을 작성해야 한다.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// 위에서 말했던 NavigationLink의 destination이 되는 뷰.
struct NavigationDetailView: View {
    
    // num 값을 MainView로부터 받아오는 Int 타입 변수를 삽입한다.
    // 이 변수가 없으면 num 값을 scope 내로 위치시킬 수가 없어서 오류가 발생한다.
    // 변수를 생성했다면 다시 올라가서 NavigationDetailView() 의 () 안에 num 값을 이쪽으로 넘겨줄 수 있도록 코드를 작성한다.
    // num: num 이라고 작성하면 된다. 이때 앞의 num은 NavigationDetailView 구조체 내부에서 정의한 num을 말하고
    // : 문자 다음의 num은 NavigationView {} 의 {} 안에 List를 만들 때 사용된 num을 말한다.
    // 즉, NavigationView 안의 num 값을 NavigationDetailView() 에서도 사용하곘다는 뜻.
    var num: Int
    
    var body: some View {
        Text("This is List \(num + 1)")
    }
}

struct NavigationMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMainView()
            .previewDevice("iPhone 13 Pro")
    }
}
