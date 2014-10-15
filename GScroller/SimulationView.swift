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

  override func drawRect(rect: CGRect) {
    Simulator.drawSimulation(bgXOffset, backgroundYOffset: bgYOffset, characterXOffset: charXOffset, characterYOffset: charYOffset)
  }


  func moveBy(x:CGFloat, y:CGFloat) {
    charXOffset += x
    charYOffset += y

    setNeedsDisplay();
  }
}
