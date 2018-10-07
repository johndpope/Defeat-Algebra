//
//  CannonController.swift
//  DefeatAlgebra
//
//  Created by yo hanashima on 2018/07/22.
//  Copyright © 2018 yo hanashima. All rights reserved.
//

import Foundation
import SpriteKit

struct CannonController {
    public static var gameScene: GameScene!
    public static var selectedCannon = Cannon(type: 0)
    public static var willFireCannon = [Cannon]()
    private static var doctorOffPos = CGPoint(x: -200, y: 170)
    public static var doctorOnPos: [CGPoint] = [
        CGPoint(x: 150, y: 170),
        CGPoint(x: 90, y: 100),
        CGPoint(x: 150, y: -370)
    ]
    public static var doctorScale: [CGFloat] = [
        0.85,
        0.6,
        0.75
    ]
    
    public static func execute(_ index: Int, cannon: Cannon?) {
        switch index {
        case 0:
            selectedCannon = cannon!
            willFireCannon.append(cannon!)
            showInputPanelWithDoctor()
            break;
        case 1:
            doneInput()
            break;
        case 2:
            startSelectEnemyForTry()
            break;
        case 3:
            doctorSays(in: .Trying, value: "3")
            break;
        case 4:
            CharacterController.showDoctor()
            doctorSays(in: .NotAvilable, value: nil)
            let wait = SKAction.wait(forDuration: 2.5)
            gameScene.run(wait, completion: {
                CharacterController.retreatDoctor()
            })
            break;
        default:
            break;
        }
    }
    
    public static func back(_ index: Int) {
        switch index {
        case 0:
            hideInputPanelWithDoctor()
            willFireCannon.removeLast()
            selectedCannon.recoverVEElementArray()
            break;
        default:
            break;
        }
    }
    
    private static func showInputPanelWithDoctor() {
        resetAll()
        showInputPanel()
        CannonTouchController.state = .Pending
        CharacterController.doctor.setScale(doctorScale[0])
        CharacterController.doctor.balloon.isHidden = false
        doctorSays(in: .WillInput, value: nil)
        CharacterController.doctor.move(from: doctorOffPos, to: doctorOnPos[0])
    }
    
    private static func hideInputPanelWithDoctor() {
        hideInputPanel()
        CannonTouchController.state = .Ready
        CharacterController.doctor.setScale(1)
        CharacterController.doctor.balloon.isHidden = true
        CharacterController.doctor.move(from: nil, to: doctorOffPos)
    }
    
    private static func doneInput() {
        hideInputPanel()
        CannonTouchController.state = .Ready
        CharacterController.doctor.setScale(1)
        CharacterController.doctor.balloon.isHidden = true
        CharacterController.doctor.move(from: nil, to: doctorOffPos)
        ItemTouchController.othersTouched()
    }
    
    private static func startSelectEnemyForTry() {
        hideInputPanel()
        doctorSays(in: .WillTry, value: nil)
        let cand = gameScene.gridNode.enemyArray.filter({ $0.state == .Attack && $0.positionX == selectedCannon.spotPos[0] })
        for enemy in cand {
            enemy.pointing()
            if enemy.positionX == selectedCannon.spotPos[0] && enemy.positionY == selectedCannon.spotPos[1] {
                enemy.zPosition = 6
            }
        }
        gameScene.isCharactersTurn = true
        gameScene.tutorialState = .Action
        gameScene.gridNode.isTutorial = true
        CannonTouchController.state = .Trying
    }
    
    public static func startTry(enemy: Enemy) {
        doctorSays(in: .Trying, value: "3")
        hideInputPanel()
        for enemy in gameScene.gridNode.enemyArray {
            enemy.removePointing()
        }
        gameScene.isCharactersTurn = true
        gameScene.tutorialState = .Action
        gameScene.gridNode.isTutorial = true
        CannonTryController.showEqGrid(enemy: enemy, cannon: selectedCannon)
    }
    
    public static func showInputPanelInTrying() {
        showInputPanel()
    }
    
    public static func fire(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        for cannon in willFireCannon {
            dispatchGroup.enter()
            cannon.throwBomb(value: gameScene.xValue) {
                cannon.resetInputVE()
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main, execute: {
            willFireCannon.removeAll()
            CannonTouchController.state = .Ready
            return completion()
        })
    }
    
    private static func resetAll() {
        CannonTouchController.state = .Ready
    }
    
    public static func doctorSays(in state: CannonLinesState, value: String?) {
        CharacterController.doctor.balloon.isHidden = false
        CannonLines.getLines(state: state, value: value).DAMultilined() { line in
            CharacterController.doctor.balloon.setLines(with: line, pos: 0)
        }
    }
    
    private static func showInputPanel() {
        gameScene.inputPanelForCannon.isActive = true
    }
    
    private static func hideInputPanel() {
        gameScene.inputPanelForCannon.isActive = false
    }
    
    public static func add(type: Int, pos: [Int]) {
        let cannon = Cannon(type: type)
        gameScene.gridNode.addObjectAtGrid(object: cannon, x: pos[0], y: pos[1])
    }
    
    public static func changeZpos(zPos: CGFloat) {
        for child in gameScene.gridNode.children {
            if child.name == "cannon" {
                child.zPosition = zPos
            }
        }
    }
    
}

struct CannonTouchController {
    
    public static var state: CannonState = .Ready
    
    public static func onEvent(cannon: Cannon?, enemy: Enemy?) {
        switch state {
        case .Ready:
            CannonController.execute(0, cannon: cannon!)
            break;
        case .Charging:
            break;
        case .Trying:
            guard let enemy = enemy else { return }
            CannonController.startTry(enemy: enemy)
            break;
        default:
            break;
        }
    }
}

enum CannonLinesState {
    case WillInput, Inputing, WillTry, Trying, InputDone, NotAvilable
}

struct CannonLines {
    static func getLines(state: CannonLinesState, value: String?) -> String {
        switch state {
        case .WillInput:
            return "砲撃の飛距離を入力するのじゃ！"
        case .Inputing:
            return setSubLineForInputing()
        case .WillTry:
            return "どの敵で試すのか選択するのじゃ"
        case .Trying:
            guard let val = value else { return "" }
            return setSubLineForTrying(index: val)
        case .NotAvilable:
            return "攻撃モードに入った敵が同じ列にいる時だけ砲撃できるんじゃ"
        default:
            return ""
        }
    }
    
    static var selectedLine = ""
    static let subLinesForInputing: [String] = [
        "わからなかったら、ためし撃ちもできるぞ！",
        "砲撃の飛距離を入力するのじゃ！"
    ]
    
    static var curIndex = 0
    static func setSubLineForInputing() -> String {
        switch curIndex {
        case 0:
            curIndex = 1
            return subLinesForInputing[0]
        case 1:
            curIndex = 0
            return subLinesForInputing[1]
        default:
            curIndex = 0
            return ""
        }
    }
    
    static func setSubLineForTrying(index: String) -> String {
        switch index {
        case "0":
            return "どうやら、グリッドを超えてしまったようじゃな..."
        case "1":
            return "ジャストミートじゃ！xが他の数でも当たるか確かめるのじゃ！"
        case "2":
            return "うーむ当たらないのう。確実に当てるにはどうしたらよいじゃろうか"
        case "3":
            return "xに入る数を選んで、試し撃ちしてみよう！"
        case "4":
            return "砲撃の飛距離を変えることもできるぞ"
        case "5":
            return "アルジェブラ砲と敵との距離に注目してみたらどうじゃろうか"
        case "6":
            return ""
        default:
            return ""
        }
    }
}

