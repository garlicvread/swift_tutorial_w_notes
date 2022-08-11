//
//  MapView.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import SwiftUI
import MapKit  // 1.5.2. MapKit 프레임워크 가져오기

struct MapView: View {

    var coordinate: CLLocationCoordinate2D  // 2.7.3. coordinate 프로퍼티 추가 -> 오류는 추후 수정
    // 2.7.3.까지 따라왔으면 LandmarkDetail.swift로 이동한다.

    // 1.5.3. 위치 정보를 담는 변수 region에 @State 옵션 추가
    // @State 옵션(attribute)를 추가하는 경우 그 변수의 데이터가 변동되면 자동으로 뷰가 업데이트된다.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286,
                                       longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2,
                               longitudeDelta: 0.2)
    )

    var body: some View {
        Map(coordinateRegion: $region)  // 1.5.4. MapView 추가
        // @State private var region 값을 받아옴.
            .onAppear {  // 2.7.5. onAppear modifier 추가 -> 현재 좌표를 기준으로 region 값을 계산하기 위한 트리거
                setRegion(coordinate)
            }
    }

    // 2.7.4. region 값을 업데이트하는 메서드 추가
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                           longitudeDelta: 0.2))
    }
}


// 1.5.5. Previews 가 static 선언돼 있는 경우 native SwiftUI view만을 렌더링한다.
// MapView를 보려면 라이브 프리뷰 버튼을 눌러야 함.
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        // 2.7.3. PreviewProvider에서 사용할 coordinate 프로퍼티 추가
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286,
                                                   longitude: -116.166_868))
    }
}

// 라이브 프리뷰 버튼을 눌렀을 때 지도가 나오면 성공적으로 코딩을 완료한 것이다.
// 이제 지금까지 만들었던 MainContentView와 CircleImage, MapView 세 뷰를 결합해야 한다.
// MainContentView로 가자.
