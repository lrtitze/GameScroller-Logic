//
//  SimulationView.swift
//  GScroller
//
//  Created by Leslie Titze on 2014.10.14.
//  Copyright (c) 2014 Leslie Titze. All rights reserved.
//

import UIKit


class SimulationView: UIView {
  var bgXOffset   = CGFloat(0.0)
  var bgYOffset   = CGFloat(0.0)
  var charXOffset = CGFloat(10.0)
  var charYOffset = CGFloat(10.0)
  
  let borderOriginBoundary:CGFloat = 8.0
  let borderExtremeBoundary:CGFloat = 24.0
  
  let farRightLimit:CGFloat = DeviceScreenWidth - BackgroundWidth
  let bottomLimit:CGFloat = DeviceScreenHeight - BackgroundHeight
  
  
  override func drawRect(rect: CGRect) {
    Simulator.drawSimulation(bgXOffset, backgroundYOffset: bgYOffset, characterXOffset: charXOffset, characterYOffset: charYOffset)
  }
  
  
  func moveBy(x:CGFloat, y:CGFloat) {
    moveOnAxis(x, charOffsetVar: &charXOffset, bgOffsetVar: &bgXOffset, bgExtremeLimit: farRightLimit, screenExtremeLimit: DeviceScreenWidth)
    moveOnAxis(y, charOffsetVar: &charYOffset, bgOffsetVar: &bgYOffset, bgExtremeLimit: bottomLimit, screenExtremeLimit: DeviceScreenHeight)
    
    setNeedsDisplay();
  }
  
  
  func moveOnAxis(amount:CGFloat, inout charOffsetVar:CGFloat, inout bgOffsetVar:CGFloat, bgExtremeLimit:CGFloat, screenExtremeLimit:CGFloat) {
    var newOffset = charOffsetVar + amount
    
    if (newOffset < borderOriginBoundary) {
      var requiredBGScroll = newOffset - borderOriginBoundary
      
      bgOffsetVar -= requiredBGScroll
      
      if (bgOffsetVar > 0) {
        bgOffsetVar = 0
      }
      newOffset = borderOriginBoundary
    }
      
    else if (newOffset > (screenExtremeLimit - borderExtremeBoundary)) {
      var requiredBGScroll = newOffset - (screenExtremeLimit - borderExtremeBoundary)
      
      bgOffsetVar -= requiredBGScroll
      
      if (bgOffsetVar < bgExtremeLimit) {
        bgOffsetVar = bgExtremeLimit
      }
      newOffset = screenExtremeLimit - borderExtremeBoundary
    }
    
    charOffsetVar = newOffset
  }
}
