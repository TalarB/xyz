//
//  ViewController.swift
//  AcceleratorAssignment
//
//  Created by Talar Boyadjian on 12/30/17.
//  Copyright © 2017 Talar Boyadjian. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
  
  let motion = CMMotionManager()
  
  var timer: Timer?
  
  var arrX: [Double] = []
  var arrY: [Double] = []
  var arrZ: [Double] = []
  
  let sensorStats = SensorStats()
  
  @IBOutlet var allMaxX: UILabel!
  @IBOutlet var allMinX: UILabel!
  @IBOutlet var allMeanX: UILabel!
  @IBOutlet var allMedianX: UILabel!
  @IBOutlet var allStdevX: UILabel!
  @IBOutlet var allCountX: UILabel!

  @IBOutlet var allMaxY: UILabel!
  @IBOutlet var allMinY: UILabel!
  @IBOutlet var allMeanY: UILabel!
  @IBOutlet var allMedianY: UILabel!
  @IBOutlet var allStdevY: UILabel!
  @IBOutlet var allCountY: UILabel!
  
  @IBOutlet var allMaxZ: UILabel!
  @IBOutlet var allMinZ: UILabel!
  @IBOutlet var allMeanZ: UILabel!
  @IBOutlet var allMedianZ: UILabel!
  @IBOutlet var allStdevZ: UILabel!
  @IBOutlet var allCountZ: UILabel!
  
  
  
  @IBOutlet var last5MaxX: UILabel!
  @IBOutlet var last5MinX: UILabel!
  @IBOutlet var last5MeanX: UILabel!
  @IBOutlet var last5MedianX: UILabel!
  @IBOutlet var last5StdevX: UILabel!
  @IBOutlet var last5CountX: UILabel!
  @IBOutlet var last5CrossX: UILabel!
  
  @IBOutlet var last5MaxY: UILabel!
  @IBOutlet var last5MinY: UILabel!
  @IBOutlet var last5MeanY: UILabel!
  @IBOutlet var last5MedianY: UILabel!
  @IBOutlet var last5StdevY: UILabel!
  @IBOutlet var last5CountY: UILabel!
  @IBOutlet var last5CrossY: UILabel!
  
  @IBOutlet var last5MaxZ: UILabel!
  @IBOutlet var last5MinZ: UILabel!
  @IBOutlet var last5MeanZ: UILabel!
  @IBOutlet var last5MedianZ: UILabel!
  @IBOutlet var last5StdevZ: UILabel!
  @IBOutlet var last5CountZ: UILabel!
  @IBOutlet var last5CrossZ: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Accelerometer Data"
    startAccelerometers()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func startAccelerometers() {
    if self.motion.isAccelerometerAvailable {
      self.motion.accelerometerUpdateInterval = 1.0 / 20.0
      self.motion.startAccelerometerUpdates()
      
      self.timer = Timer(fire: Date(), interval: (1.0/20.0), repeats: true, block: { [weak self] (timer) in
        guard let `self` = self else { return }
        if let data = self.motion.accelerometerData {
   
          self.sensorStats.updateSensor(Float(data.acceleration.x), withY: Float(data.acceleration.y), withZ: Float(data.acceleration.z))
          
          self.allMeanX.text = String(describing: round(1000*self.sensorStats.meanX())/1000)
          self.allMeanY.text = String(describing: round(1000*self.sensorStats.meanY())/1000)
          self.allMeanZ.text = String(describing: round(1000*self.sensorStats.meanZ())/1000)
          
          let count = String(describing: self.sensorStats.measurementsCount())
          self.allCountX.text = count
          self.allCountY.text = count
          self.allCountZ.text = count
          
          self.allMinX.text = String(describing: round(1000*self.sensorStats.minX())/1000)
          self.allMinY.text = String(describing: round(1000*self.sensorStats.minY())/1000)
          self.allMinZ.text = String(describing: round(1000*self.sensorStats.minZ())/1000)

          self.allMaxX.text = String(describing: round(1000*self.sensorStats.maxX())/1000)
          self.allMaxY.text = String(describing: round(1000*self.sensorStats.maxY())/1000)
          self.allMaxZ.text = String(describing: round(1000*self.sensorStats.maxZ())/1000)

          self.allMedianX.text = String(describing: round(1000*self.sensorStats.medianX())/1000)
          self.allMedianY.text = String(describing: round(1000*self.sensorStats.medianY())/1000)
          self.allMedianZ.text = String(describing: round(1000*self.sensorStats.medianZ())/1000)
          
          self.allStdevX.text = String(describing: round(1000*self.sensorStats.standardDeviationX())/1000)
          self.allStdevY.text = String(describing: round(1000*self.sensorStats.standardDeviationY())/1000)
          self.allStdevZ.text = String(describing: round(1000*self.sensorStats.standardDeviationZ())/1000)

          
          self.last5MeanX.text = String(describing: round(1000*self.sensorStats.partialMeanX())/1000)
          self.last5MeanY.text = String(describing: round(1000*self.sensorStats.partialMeanY())/1000)
          self.last5MeanZ.text = String(describing: round(1000*self.sensorStats.partialMeanZ())/1000)
          
          let partialCount = String(describing: self.sensorStats.partialMeasurementsCount())
          self.last5CountX.text = partialCount
          self.last5CountY.text = partialCount
          self.last5CountZ.text = partialCount

          self.last5MinX.text = String(describing: round(1000*self.sensorStats.partialMinX())/1000)
          self.last5MinY.text = String(describing: round(1000*self.sensorStats.partialMinY())/1000)
          self.last5MinZ.text = String(describing: round(1000*self.sensorStats.partialMinZ())/1000)
          
          self.last5MaxX.text = String(describing: round(1000*self.sensorStats.partialMaxX())/1000)
          self.last5MaxY.text = String(describing: round(1000*self.sensorStats.partialMaxY())/1000)
          self.last5MaxZ.text = String(describing: round(1000*self.sensorStats.partialMaxZ())/1000)

          self.last5MedianX.text = String(describing: round(1000*self.sensorStats.partialMedianX())/1000)
          self.last5MedianY.text = String(describing: round(1000*self.sensorStats.partialMedianY())/1000)
          self.last5MedianZ.text = String(describing: round(1000*self.sensorStats.partialMedianY())/1000)

          self.last5StdevX.text = String(describing: round(1000*self.sensorStats.partialStandardDeviationX())/1000)
          self.last5StdevY.text = String(describing: round(1000*self.sensorStats.partialStandardDeviationY())/1000)
          self.last5StdevZ.text = String(describing: round(1000*self.sensorStats.partialStandardDeviationZ())/1000)

          self.last5CrossX.text = String(self.sensorStats.partialZeroCrossingsX())
          self.last5CrossY.text = String(self.sensorStats.partialZeroCrossingsY())
          self.last5CrossZ.text = String(self.sensorStats.partialZeroCrossingsZ())
        }
      })
      
      RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    }
  }

}

