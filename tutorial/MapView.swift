//
//  MapView.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI
import MapKit  // 5.2. MapKit 프레임워크 가져오기

struct MapView: View {

    // 5.3. 위치 정보를 담는 변수 region에 @State 옵션 추가
    // @State 옵션(attribute)를 추가하는 경우 그 변수의 데이터가 변동되면 자동으로 뷰가 업데이트된다.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286,
                                       longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2,
                               longitudeDelta: 0.2)
    )

    var body: some View {
        Map(coordinateRegion: $region)  // 5.4. MapView 추가
        // @State private var region 값을 받아옴.
    }
}


// 5.5. Previews 가 static 선언돼 있는 경우 native SwiftUI view만을 렌더링한다.
// MapView를 보려면 라이브 프리뷰 버튼을 눌러야 함.
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

// 라이브 프리뷰 버튼을 눌렀을 때 지도가 나오면 성공적으로 코딩을 완료한 것이다.
// 이제 지금까지 만들었던 MainContentView와 CircleImage, MapView 세 뷰를 결합해야 한다.
// MainContentView로 가자.
