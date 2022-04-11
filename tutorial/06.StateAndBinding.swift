//
//  06.StateAndBinding.swift
//  tutorial
//
//  Created by Kim, Che-Pill on 2022/04/09.
//


// @State: SwiftUI에 의해 관리되는 값을 읽고 쓸 수 있는 property wrapper
// @State는 하나의 View struct 내부에서 한 변수가 여러 view에서 공유되고, 값 변화에 영향을 받는 경우 사용한다.
// @State를 변수 앞에 추가하면 SwiftUI가 자동으로 변경사항을 체크하고 해당 변수를 사용하는 view를 업데이트한다.

// @Binding: SwiftUI에 의해 관리되는 값을 읽고 쓸 수 있는 property wrapper
// @Binding은 여러 개의 View struct에서 한 개의 변수값을 공유할 필요가 있을 때 사용한다.
// 즉, 코드가 복잡해지거나 하나의 코드를 여러 곳에서 사용하는 경우 해당 View를 따로 분리하여 사용하려는 목적에서 사용한다.

import Foundation

import SwiftUI

struct StateBindingView: View {
    // isPlaying: Boolean 변수. 음악이 실행되고 있는지 여부 체크.
    // 토글될 때마다 음악 실행 여부 검사, 실행되면 true, 아니면 false 로 값이 변해야 하며, view에 업데이트되어야 함.
    // @State를 사용하면 변경사항을 자동으로 체크하고 업데이트 해준다.
    @State private var isPlaying = false

    // @Environment: SwiftUI에서 제공하는 환경 변수.
    // \.colorScheme: 색상 스키마. "\." 는 현재 환경을 의미함.
    @Environment(\.colorScheme) var colorScheme

    // @State가 private이므로 이 변수는 이 view 내에서만 사용할 수 있다.
    @State private var progress: Double = 65.0  // Double = 65.0: 음악 진행률.
    @State private var time: Int = 188  // Int = 188: 음악 재생 시간.
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    // Timer.publish()의 인자 설명
    // every: 몇 초마다 실행할 것인지에 대한 설정.
    // on: 실행할 스레드. .current: 현재 스레드. .main: 메인 스레드. .common: 공통 스레드.
    // in: 실행할 스레드가 있는 스레드 그룹. .common: 공통 스레드.
    // 스레드란 간단히 말해 CPU 코어라고 생각하면 편하다(실은 다름)
    // .autoconnect(): 자동으로 스레드에 연결하는 기능 (이건 확신이 좀 없음)
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: (UIImage(named: "music.png")!))
                // ! : 옵셔널. nil(다른 언어에서는 null이라고 표현하는 경우가 많음) 값 반환이 필요한 경우 사용한다.
                //     - 옵셔널은 nil 또는 nil이 아닌 값만을 가질 수 있다.
                //     - nil: 실행 과정에서 오류가 발생했을 때
                //     - nil 아닌 값: 오류가 발생하지 않았을 때, 반환하려는 값이 옵셔널로 둘러싸인 형태의 값.
                // !를 사용하면 오류 대신 nil 값을 반환하므로 오류 발생 가능성이 있는 경우 옵셔널을 사용한다.

                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Image(uiImage: (UIImage(named: colorScheme == .dark ? "music_text.png" : "music_text_light.png")!))
                // ? : 삼항 연산자. 여기서는 colorScheme 이 .dark와 같다면 "music_text.png", 다르다면 "music_text_light.png" 값을 반환한다.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 100)
            }
            VStack {
                ProgressView("", value: progress, total: 188)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.pink))

                HStack {
                    Text("\(Int(progress)/60):\(String(format: "%02d", Int(progress)%60))")
                            .fontWeight(.bold)

                    Spacer()

                    Text("\(time/60):\(String(format: "%02d", time%60))")
                        .fontWeight(.bold)
                }
            }
            .frame(width: 350)
            .padding()

            HStack(spacing: 50) {
                Image(systemName: "backward.fill")

//                // @State 방식의 Button View 코드. 아래의 Binding 방식 View를 위해 주석 처리함.
//
//                // 재생 버튼 추가
//                // Button의 보여지는 영역에 image 삽입
//                Button(action: {
//                    // Button 클릭 시 event추가
//                    // 클릭할 때 isPlaying이 true라면 false로 변경, false라면 true로 변경 --> self.isPlaying.toggle() 로 구현
//                    self.isPlaying.toggle()
//                }) {
//                    // isPlaying ? "pause.fill" : "play.fill" -->
//                    // isPlaying이 true이면 "pause.fill"이라는 sfsymbol 이미지를 출력
//                    // isPlaying이 false이면 "play.fill"이라는 sfsymbol 이미지를 출력
//                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
//                            .foregroundColor(.pink)
//                            .frame(width: 50, height: 50)
//                }

                // 하단의 PlayButton View struct를 사용하기 위한 버튼 선언.
                // PlayButton의 View를 사용자에게 보여주기 위한 것.
                // isPlaying: @isPlaying을 인자로 입력한다. PlayButton의 isPlaying 변수에 StateBindingView의 isPlaying 변수값을 전달하는 것.
                PlayButton(isPlaying: $isPlaying)

                Image(systemName: "forward.fill")
            }
            .font(.system(size: 40))
        }
        .onReceive(timer) { _ in
            if isPlaying && self.progress < 100 {
                self.progress += 1
            }
        }
    }
}

// @Binding 방식으로 버튼 View 생성
// View struct 생성: PlayButton

struct PlayButton: View {
    // PlayButton의 Button에서도 기존과 동일하게 isPlaying.toggle()이라는 이벤트가 발생한다.
    // 그러나 지금은 isPlaying 변수는 StateBindingView에서만 선언되어 있다. 따라서 PlayButton에서는 해당 변수를 사용할 수 없다.
    // isPlaying 변수를 PlayButton 에서 사용하려면 PlayButton View와 isPlaying 변수를 연결해야 한다.
    // PlayButton에 @Binding var isPlaying: Bool을 선언한다.
    // @Binding을 변수 앞에 입력하면 연결된 View 사이의 양방향 연결이 가능해진다.
    // PlayButton에서 toggle된 isPlaying 값이 StateBindingView로도 반영되어야 하므로 라인 101의 isPlaying 앞에 $를 붙인다.
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(.pink)
                .frame(width: 50, height: 50)
        }
    }
}
// PlayButton View struct를 만들었으니 예전 button 위치에 PlayButton을 선언한다.
// Image(systemName: "backward.fill"), Image(systemName: "forward.fill") 사이에 위치시키면 된다.


struct StateBindingView_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingView()
            .previewDevice("iPhone 13 Pro")
    }
}
