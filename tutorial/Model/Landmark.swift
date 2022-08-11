//
//  Landmark.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import Foundation
import SwiftUI  // 2.1.5. imageName 변수 추가를 위한 프레임워크 호출
import CoreLocation  // 2.1.7. computed property인 locationCoordinates를 위한 라이브러리

// 2.1.3. Landmark 구조체(structure) 정의
// 몇 가지 필요한 데이터가 이미 landmarkData.json 파일에 담겨 있는데, 이 json파일에 담겨 있는 데이터의 항목명과 동일하게 항목을 작성한다.
// Codable 옵션은 데이터를 Landmark 구조체와 json 파일 간 데이터 전송을 위한 것
// 나중에 Codable 프로토콜의 Decodable 컴포넌트가 사용됨: 파일에서 데이터를 읽기 위한 것.
struct Landmark: Hashable, Codable, Identifiable {  // 2.5.3. Identifiable 프로토콜을 따르도록 코드 재작성 -> 데이터를 읽을 때 id 값을 디코딩할 수 있도록 속성을 추가하는 것

    // 2.5.3. Landmark 데이터는 Identifiable 프로토콜 사용에 필요한 id 값이 이미 정의가 돼 있는 상태임 -> 2.5.3.까지 따라왔으면 LandmarkList.swift 파일로 이동
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    // 2.1.5. imageName 변수 추가: Assets에 등록된 이미지 파일의 파일명을 읽어오기 위한 것
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    // 2.1.6. 랜드마크 위치 정보를 담기 위한 변수 coordinates 선언
    private var coordinates: Coordinates

    // 2.1.7. locationCoordinate: computed property -> var 로 선언
    // computed property는 다른 속성을 기반으로 해당 속성 값이 결정됨. 즉, 메모리 공간을 가지지 않음.
    // 선언 시점에 기본값을 저장하지 않으므로 형식 추론이 불가능하며, 따라서 반드시 자료형(Type)을 같이 선언해야 함
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}


// 여기까지 코딩이 됐으면 이제 ModelData.swift 파일을 작성해야 한다.
// ModelData.swift 파일을 생성하자. 일반 Swift 파일이다.
