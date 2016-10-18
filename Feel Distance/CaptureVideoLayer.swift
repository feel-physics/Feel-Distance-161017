//
//  CaptureVideoLayer.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/18.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureVideoLayer: AVCaptureVideoPreviewLayer {
    
    override init(session: AVCaptureSession) {
        connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
        videoGravity                = AVLayerVideoGravityResizeAspectFill
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}