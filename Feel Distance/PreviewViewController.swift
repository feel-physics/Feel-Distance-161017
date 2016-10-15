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

    //セッションの作成
    let captureSession = AVCaptureSession()
    
    //デバイス一覧の取得
    let devices = AVCaptureDevice.devices()
    
    var cameraDevices: AVCaptureDevice!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        print("PreviewViewController: ", previewView.frame)

        prepareCaputureSessin()
        
        //画像を表示するレイヤーを生成
        let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        captureVideoLayer.connection.videoOrientation     = AVCaptureVideoOrientation.LandscapeRight
        captureVideoLayer.frame        = previewView.frame
        captureVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        //Viewに背景として追加
        previewView.layer.insertSublayer(captureVideoLayer, atIndex: 0)
        
        startRunning()
    }

    func prepareCaputureSessin() -> AVCaptureSession {
        //バックカメラをcameraDevicesに格納
        for device in devices {
            if device.position == AVCaptureDevicePosition.Back {
                self.cameraDevices = device as! AVCaptureDevice
            }
        }
        //バックカメラからVideoInputを取得
        let videoInput: AVCaptureInput!
        videoInput = try! AVCaptureDeviceInput.init(device: self.cameraDevices)
        //セッションに追加
        captureSession.addInput(videoInput)
        //出力先を生成
        let imageOutput = AVCaptureStillImageOutput()
        //セッションに追加
        captureSession.addOutput(imageOutput)
        
        return captureSession
    }
    
    func startRunning() {
        //セッション開始
        captureSession.startRunning()
    }
}