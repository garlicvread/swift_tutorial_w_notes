//
//  MainContentView.swift
//  tutorial
//
//  Created by 김제필 on 8/10/22.
//

import Foundation
import SwiftUI

struct MainContentView: View {
    var body: some View {

        // 3.1., 3.2. VStack 추가
        VStack(alignment: .leading) {  // 3.5. alignment 옵션 추가
            Text("Turtle Rock")
                .font(.title)

            // 3.6. HSTack 추가
            HStack {
                Text("Joshua Tree National Park")  // 3.3. TextView의 placeholder 변경
                    .font(.subheadline)  // 3.4. 폰트 변경

                Spacer()  // 3.8. Spacer 추가

                Text("California")  // 3.7. TextView 추가
                    .font(.subheadline)
            }
        }
        .padding()  // 3.9. 패딩 추가
    }
}


struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
