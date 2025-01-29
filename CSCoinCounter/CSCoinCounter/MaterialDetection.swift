//
//  MaterialDetection.swift
//  CSCoinCounter
//
//  Created by Sanjit Thangarasu on 1/21/20.
//  Copyright © 2020 Cloud Systems. All rights reserved.
//

import UIKit
import AVKit
import Vision

class MaterialDetection: UIViewController {
    
    @IBOutlet weak var detectionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else{return}
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else{return}
        
        captureSession.addInput(input)
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        previewLayer.addSublayer(detectionLabel.layer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
