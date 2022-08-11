//
//  ModelData.swift
//  tutorial
//
//  Created by 김제필 on 8/11/22.
//

import Foundation

// 2.1.10 landmarkData.json의 데이터를 받아올 어레이 선언
var landmarks: [Landmark] = load("landmarkData.json")

// 2.1.9. 애플리케이션의 메인 번들에서 지정된 이름의 json 데이터를 가져오는 메서드 생성
// load 메서드는 Codable 프로토콜의 구성요소인 Decodable 프로토콜의 반환 타입을 따른다.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self,
                                  from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// 여기까지 작업이 끝났다면 디렉토리를 정리하자.
// 어떤 디렉토리에 어떤 파일을 배치할 것인지는 공식 문서를 보면 나온다.

// 이제 SwiftUIView 파일인 LandmarkRow.swift를 만들자.
