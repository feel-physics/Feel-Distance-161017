//
//  PreviewViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/15.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit
import AVFoundation

class PreviewViewController: UIViewController {
    
    @IBOutlet var previewView: UIView!
    
    override func viewDidAppear(animated: Bool) {
        
        print("PreviewViewController@viewDidAppear: ", previewView.frame)
        
        let captureSession = CaptureSession()
        
        //画像を表示するレイヤーを生成
        let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        captureVideoLayer.connection.videoOrientation     = AVCaptureVideoOrientation.LandscapeRight
        captureVideoLayer.frame        = previewView.frame
        captureVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        //Viewに背景として追加
        previewView.layer.insertSublayer(captureVideoLayer, atIndex: 0)

        captureSession.startRunning()
    }
}