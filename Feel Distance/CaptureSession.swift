//
//  CaptureSession.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation
import AVFoundation

class CaptureSession: AVCaptureSession {
    override init() {
        //セッションの作成
        super.init()
        //デバイス一覧の取得
        let devices = AVCaptureDevice.devices()
        //バックカメラをcameraDevicesに格納
        var cameraDevices: AVCaptureDevice!
        for device in devices {
            if device.position == AVCaptureDevicePosition.Back {
                cameraDevices = device as! AVCaptureDevice
            }
        }
        //バックカメラからVideoInputを取得
        let videoInput: AVCaptureInput!
        videoInput = try! AVCaptureDeviceInput.init(device: cameraDevices)
        //セッションに追加
        self.addInput(videoInput)
        //出力先を生成
        let imageOutput = AVCaptureStillImageOutput()
        //セッションに追加
        self.addOutput(imageOutput)
    }
}