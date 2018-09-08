//
//  EnemyProperty.swift
//  DefeatAlgebra
//
//  Created by yo hanashima on 2018/02/01.
//  Copyright © 2018 yo hanashima. All rights reserved.
//

import Foundation

class EnemyProperty {
    
    static let initialEnemyPosArray = [
        [[1, 10, 0], [4, 10, 0], [7, 10, 0]], //1 // [xPos, yPos, ve]
        [[1, 10, 1], [3, 10, 3], [5, 10, 2], [7, 10, 3]], //2
        [[1, 11, 5], [4, 11, 6], [7, 11, 4], [3, 9, 6], [5, 9, 4]], //3
        [[0, 10, 7], [2, 10, 8], [4, 10, 9], [6, 10, 7], [8, 10, 8], [2, 8, 9], [6, 8, 7]], //4
        [[2, 10, 9], [6, 10, 11], [2, 8, 9], [6, 8, 11], [4, 9, 9]], //5
        [[2, 10, 6], [6, 10, 6], [2, 8, 6], [6, 8, 6], [4, 9, 6], ], //6
    ]
    
    static let level1 = [0, 0, 0, 0, 0, 1]
    static let level1VE = ["1": [[3, 0, 0]]] // [3 enemies, from ve0, yRange]
    static let level1ForEdu = [String: [Int]]()
    static let level2 = [0, 0, 0, 1, 0, 0, 0, 0, 2]
    static let level2VE = ["1": [[1, 1, 1], [1, 2, 1], [2, 3, 1]], "2": [[1, 1, 1], [1, 2, 1], [2, 3, 1]]]
    static let level2ForEdu = ["100": [0, 1, 0]] // from ve0, 1 pair, yRange
    static let level3 = [0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 3]
    static let level3VE = ["1": [[2, 4, 2], [2, 5, 2]], "2": [[2, 4, 2], [2, 6, 2]], "3": [[2, 4, 2], [1, 5, 2], [1, 6, 2]]]
    static let level3ForEdu = ["100": [0, 1, 0]]
    static let level4 = [0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1]
    static let level4VE = ["1": [[1, 7, 2], [1, 8, 2], [1, 8, 2]]]
    static let level4ForEdu = ["100": [0, 1, 0]]
    static let level5 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1]
    static let level5VE = ["1": [[2, 9, 2], [2, 11, 2]]]
    static let level5ForEdu = ["100": [0, 1, 0]]
    static let level6 = [0, 0, 1, 0, 0, 0, 1, 0, 0, 1]
    static let level6VE = ["1": [[3, 0, 2]]]
    static let level6ForEdu = ["100": [0, 1, 0]]
    
    static func judgeCorrectVe(origin: String, input: String) -> Bool {
        if let cand = vELabelPairDict[origin] {
            let result = cand.contains(input)
            return result
        } else {
            return false
        }
    }
    
    private static let vELabelPairDict: [String: [String]] = [
        "x+1-1": ["x"], "2+x-2": ["x"], "x+2-1": ["x+1", "1+x"], "2+x-1": ["x+1", "1+x"], "2x-2+2": ["2x"], "1+2x-1": ["2x"], "2x-1+2": ["2x+1", "1+2x"], "3-2+2x": ["2x+1", "1+2x"]
    ]
    
    static let addEnemyManager = [level1, level2, level3, level4, level5, level6]
    static let addEnemyVEManager = [level1VE, level2VE, level3VE, level4VE, level5VE, level6VE]
    static let addEnemyForEduManager = [level1ForEdu, level2ForEdu, level3ForEdu, level4ForEdu, level5ForEdu, level6ForEdu]
    
    static func getNumOfAllEnemy(stageLevel: Int, completion: @escaping (Int) -> Void) {
        let start = EnemyProperty.initialEnemyPosArray[stageLevel].count
        let dispatchGroup = DispatchGroup()
        var totalNum = start
        for i in EnemyProperty.addEnemyManager[stageLevel] {
            dispatchGroup.enter()
            if i != 0 {
                let array = EnemyProperty.addEnemyVEManager[stageLevel][String(i)]
                array?.forEach{ totalNum += $0[0] }
                dispatchGroup.leave()
            } else {
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main, execute: {
            completion(totalNum)
        })
    }
    
}
