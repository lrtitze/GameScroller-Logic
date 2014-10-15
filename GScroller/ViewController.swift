//
//  ViewController.swift
//  GScroller
//
//  Created by Leslie Titze on 2014.10.14.
//  Copyright (c) 2014 Leslie Titze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var simulationView:SimulationView?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    let translation = recognizer.translationInView(self.view)
    //recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translation.x, y:recognizer.view!.center.y + translation.y)
    simulationView?.moveBy(translation.x, y: translation.y)

    recognizer.setTranslation(CGPointZero, inView: self.view)
  }

}

