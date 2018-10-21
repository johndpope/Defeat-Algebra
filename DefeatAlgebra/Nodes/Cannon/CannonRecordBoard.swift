//
//  CannonRecordBoard.swift
//  DefeatAlgebra
//
//  Created by yo hanashima on 2018/10/08.
//  Copyright © 2018 yo hanashima. All rights reserved.
//

import Foundation
import SpriteKit

class CannonRecordBoard: SKSpriteNode {
    
    let posLeft = CGPoint(x: 30, y: 1215)
    let posRight = CGPoint(x: 440, y: 1215)
    
    let marginWidth: CGFloat = 20
    let marginHeight: CGFloat = 40
    
    let leftMarginTop: CGFloat = 20
    let leftMarginTopLabel: CGFloat = 60
    let leftMarginDistTitle: CGFloat = 130
    let leftMarginRecordL: CGFloat = 0
    let leftMarginRecordE: CGFloat = 80
    let leftMarginRecordC: CGFloat = 140
    let leftMarginDist: CGFloat = 210
    let topMargin: CGFloat = 40
    let lineSpace: CGFloat = 55
    
    var scrollViewYPos: CGFloat = 0
    var startTouchYPos: CGFloat = 0
    var scrollView = SKSpriteNode()
    var isScrollable = false
    var numOfCannon = 1 {
        didSet {
            if numOfCannon > 3 {
                isScrollable = true
            }
        }
    }
    var numOfXValue = 3
    var currentVeLabel = SKLabelNode()
    var distLabel: [SKLabelNode] = [SKLabelNode]() {
        didSet {
            if distLabel.count == 3 {
                if distLabel[0].text! == distLabel[1].text! && distLabel[1].text! == distLabel[2].text! {
                    if distLabel[0].text! == "0" {
                        for label in distLabel {
                            label.fontColor = UIColor.blue
                        }
                        currentVeLabel.fontColor = UIColor.blue
                        CannonTryController.isCorrect = true
                        DataController.setDataForGetAnswer()
                    } else {
                        for label in distLabel {
                            label.fontColor = UIColor.red
                        }
                        currentVeLabel.fontColor = UIColor.red
                        CannonTryController.hintOn = true
                        DataController.setDataForGetHint()
                    }
                }
            }
        }
    }
    
    init(isLeft: Bool, enemyVe: String, cannonVe: String) {
        /* Initialize with enemy asset */
        let texture = SKTexture(imageNamed: "cannonRecordBoard")
        let bodySize = CGSize(width: 285, height: 900)
        super.init(texture: texture, color: UIColor.clear, size: bodySize)
        
        isUserInteractionEnabled = true

        zPosition = 2
        if isLeft {
            position = posLeft
        } else {
            position = posRight
        }
        anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        setScrollView()
        
        setEnemy(ve: enemyVe)
        setCannon(ve: cannonVe)
        setDistLabel()
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isScrollable else { return }
        /* Get touch point */
        let touch = touches.first!              // Get the first touch
        let location = touch.location(in: self) // Find the location of that touch in this view
        let nodeAtPoint = atPoint(location)     // Find the node at that location
        if nodeAtPoint.name == "scrollView" {
            scrollViewYPos = scrollView.position.y
            startTouchYPos = location.y
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isScrollable else { return }
        if startTouchYPos != 0 {
            /* Get touch point */
            let touch = touches.first!              // Get the first touch
            let location = touch.location(in: self) // Find the location of that touch in this view
            CharacterController.doctor.balloon.isHidden = true
            let dif = location.y - startTouchYPos
            if scrollView.position.y > self.frame.height/2-marginHeight-10 {
                scrollView.position = CGPoint(x: scrollView.position.x, y: scrollViewYPos+dif)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isScrollable else { return }
        if scrollView.position.y < self.frame.height/2-marginHeight {
            let move = SKAction.moveTo(y: self.frame.height/2-marginHeight, duration: 0.1)
            scrollView.run(move)
        }
        startTouchYPos = 0
    }
    private func setScrollView() {
        let texture = SKTexture(imageNamed: "ScrollViewForCannonLog")
        let bodySize = CGSize(width: self.frame.width-marginWidth*2, height: self.frame.height-marginHeight*2)
        scrollView = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        scrollView.name = "scrollView"
        scrollView.anchorPoint = CGPoint(x: 0, y: 1)
        scrollView.position = CGPoint(x: -self.frame.width/2+marginWidth, y: self.frame.height/2-marginHeight)
        scrollView.zPosition = 1
        
        let mask = SKShapeNode(rectOf: CGSize(width: scrollView.frame.width, height: scrollView.frame.height))
        mask.fillColor = UIColor.white
        
        //クロップノードを作成する。
        let cropNode = SKCropNode()
        cropNode.zPosition = 1
        cropNode.name = "mask"
        cropNode.maskNode = mask
        cropNode.addChild(scrollView)
        cropNode.position = CGPoint(x: self.frame.width/2, y: -self.frame.height/2)
        addChild(cropNode)
    }
    
    func setEnemy(ve: String) {
        let texture = SKTexture(imageNamed: "front1")
        let bodySize = CGSize(width: 40, height: 40)
        let enemyNode = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        enemyNode.zPosition = 1
        enemyNode.position = CGPoint(x: leftMarginTop, y: -topMargin)
        scrollView.addChild(enemyNode)
        let labelPos = CGPoint(x: leftMarginTopLabel, y: -topMargin)
        createLabel(text: ve, color: nil, pos: labelPos, name: nil, fontSize: nil)
    }
    
    func setCannon(ve: String) {
        let texture = SKTexture(imageNamed: "cannonFront")
        let bodySize = CGSize(width: 40, height: 40)
        let cannonNode = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        cannonNode.zPosition = 1
        cannonNode.position = CGPoint(x: leftMarginTop, y: -(topMargin+lineSpace))
        scrollView.addChild(cannonNode)
        let labelPos = CGPoint(x: leftMarginTopLabel, y: -(topMargin+lineSpace))
        createLabel(text: ve, color: nil, pos: labelPos, name: nil, fontSize: nil, isCannon: true)
        // x= label
        for i in 1...3 {
            let xlabelPos = CGPoint(x: leftMarginRecordL, y: -(topMargin+lineSpace*CGFloat(i+1)))
            createLabel(text: "x=\(i)", color: nil, pos: xlabelPos, name: nil, fontSize: nil)
        }
    }
    
    func setDistLabel() {
        let labelPos1 = CGPoint(x: leftMarginDistTitle, y: -(topMargin+lineSpace-10))
        let labelPos2 = CGPoint(x: leftMarginDistTitle, y: -(topMargin+lineSpace+10))
        createLabel(text: "砲撃した所と", color: nil, pos: labelPos1, name: nil, fontSize: 20, font: DAFont.fontNameForTutorial)
        createLabel(text: "敵との距離", color: nil, pos: labelPos2, name: nil, fontSize: 20, font: DAFont.fontNameForTutorial)
    }
    
    public func createRecord(xValue: Int, distanse: Int, enemyValue: Int, cannonValue: Int) {
        let lineIndex = 1 + numOfCannon + (numOfXValue-3) + (xValue-1)
        enemyForRecord(lineIndex: lineIndex, value: enemyValue)
        cannonForRecord(lineIndex: lineIndex, value: cannonValue)
        let distlabelPos = CGPoint(x: leftMarginDist, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        createLabel(text: String(distanse), color: nil, pos: distlabelPos, name: nil, fontSize: nil, isDistanse: true)
    }
    
    private func enemyForRecord(lineIndex: Int, value: Int) {
        let texture = SKTexture(imageNamed: "front1")
        let bodySize = CGSize(width: 25, height: 25)
        let enemyNode = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        enemyNode.zPosition = 1
        enemyNode.position = CGPoint(x: leftMarginRecordE, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        scrollView.addChild(enemyNode)
        let labelPos = CGPoint(x: leftMarginRecordE+20, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        createLabel(text: String(value), color: nil, pos: labelPos, name: nil, fontSize: 25)
    }
    
    private func cannonForRecord(lineIndex: Int, value: Int) {
        let texture = SKTexture(imageNamed: "cannonFront")
        let bodySize = CGSize(width: 25, height: 25)
        let cannonNode = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        cannonNode.zPosition = 1
        cannonNode.position = CGPoint(x: leftMarginRecordC, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        scrollView.addChild(cannonNode)
        let labelPos = CGPoint(x: leftMarginRecordC+20, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        createLabel(text: String(value), color: nil, pos: labelPos, name: nil, fontSize: 25)
    }
    
    
    public func createCannon(ve: String) {
        let lineIndex = 1 + numOfCannon + numOfXValue
        numOfCannon += 1
        distLabel.removeAll()
        let texture = SKTexture(imageNamed: "cannonFront")
        let bodySize = CGSize(width: 40, height: 40)
        let cannonNode = SKSpriteNode(texture: texture, color: UIColor.clear, size: bodySize)
        cannonNode.zPosition = 1
        cannonNode.position = CGPoint(x: leftMarginTop, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        scrollView.addChild(cannonNode)
        let labelPos = CGPoint(x: leftMarginTopLabel, y: -(topMargin+lineSpace*CGFloat(lineIndex)))
        createLabel(text: ve, color: nil, pos: labelPos, name: nil, fontSize: nil, isCannon: true)
        // x= label
        numOfXValue += 3
        for i in 1...3 {
            let xlabelPos = CGPoint(x: leftMarginRecordL, y: -(topMargin+lineSpace*CGFloat(lineIndex+i)))
            createLabel(text: "x=\(i)", color: nil, pos: xlabelPos, name: nil, fontSize: nil)
        }
    }
    
    func createLabel(text: String, color: UIColor?, pos: CGPoint, name: String?, fontSize: CGFloat?, font: String? = DAFont.fontName, isDistanse: Bool = false, isCannon: Bool = false) {
        let veLabel = SKLabelNode(fontNamed: font)
        veLabel.text = text
        veLabel.horizontalAlignmentMode = .left
        veLabel.verticalAlignmentMode = .center
        veLabel.fontSize = fontSize ?? 30
        veLabel.position = pos
        veLabel.zPosition = 1
        veLabel.fontColor = color ?? UIColor.white
        veLabel.name = name ?? ""
        if isDistanse {
            distLabel.append(veLabel)
        } else if isCannon {
            currentVeLabel = veLabel
        }
        scrollView.addChild(veLabel)
    }
}
