import CoreMotion
import SwiftUI

class MotionLogic: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var pullUpCount = 0
    
    private var isMovingUp = false
    private var isOnTop = false
    private var isMovingDown = false
    
    func startMonitoring() {
        guard !motionManager.isDeviceMotionActive else { return }
        
        motionManager.deviceMotionUpdateInterval = 0.1
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { [weak self] motion, _ in
            guard let strongSelf = self, let motion = motion else { return }
            
            if motion.userAcceleration.y > 0.3 && !strongSelf.isMovingUp {
                           strongSelf.isMovingUp = true
                           strongSelf.isMovingDown = false
                       }
            if strongSelf.isMovingUp && abs(motion.userAcceleration.y) < 0.1 {
                           strongSelf.isOnTop = true
                       }
            if strongSelf.isOnTop && motion.userAcceleration.y < -0.5 {
                           if !strongSelf.isMovingDown {
                               strongSelf.pullUpCount += 1
                               strongSelf.isMovingDown = true
                           }
                           strongSelf.isMovingUp = false
                           strongSelf.isOnTop = false
                       }
                   }
        }
    
      
    func stopMonitoring() {
          if motionManager.isDeviceMotionActive {
              motionManager.stopDeviceMotionUpdates()
              isMovingUp = false
              isOnTop = false
              isMovingDown = false
          }
      }
  }
