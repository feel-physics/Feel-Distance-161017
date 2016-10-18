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
    
    /*
    ios - StoryBoardで配置したUICollectionViewのサイズ動的変更について - スタック・オーバーフロー
    http://ja.stackoverflow.com/questions/10098/storyboard%E3%81%A7%E9%85%8D%E7%BD%AE%E3%81%97%E3%81%9Fuicollectionview%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E5%8B%95%E7%9A%84%E5%A4%89%E6%9B%B4%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6
    */
    override func viewDidLayoutSubviews() {
        // シュミレータのデバッグ時はtrue
        func isSimulator() -> Bool {
            return TARGET_OS_SIMULATOR != 0
        }

        if !isSimulator() {
            let captureSession = CaptureSession()
            
            //画像を表示するレイヤーを生成
            let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
            captureVideoLayer.connection.videoOrientation     = AVCaptureVideoOrientation.LandscapeRight
            captureVideoLayer.frame        = view.frame
            captureVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            //Viewに背景として追加
            view.layer.insertSublayer(captureVideoLayer, atIndex: 0)
            
            captureSession.startRunning()
        }
    }
}