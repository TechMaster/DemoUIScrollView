//
//  TapToZoom.swift
//  DemoScrollView
//
//  Created by techmaster on 7/12/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class TapToZoom: UIViewController,UIScrollViewDelegate {
     var imgView: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView = UIImageView(image: UIImage(named: "lb.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width: ScrollView.frame.size.width, height: ScrollView.frame.size.height)
        imgView.isUserInteractionEnabled = true // tương tác giao diện
        imgView.isMultipleTouchEnabled = true // double kick
        // single tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(gesture:)))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        // double tap
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubletapImg(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        tap.require(toFail: doubleTap)
        imgView.addGestureRecognizer(doubleTap)
        imgView.contentMode = .scaleAspectFit
        ScrollView.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
        ScrollView.minimumZoomScale = 1
        ScrollView.maximumZoomScale = 5
        self.ScrollView.addSubview(imgView)
        ScrollView.delegate = self
        
    }
    //MARK: zoom behavior
    //tap to zoom in
    func tapImg(gesture: UITapGestureRecognizer){
        let postion = gesture.location(in: imgView)
        zoomRectForScale(scale: ScrollView.zoomScale * 1.5, center: postion) //tap 1 * 1.5
        
    }
    //tap to zoom out
    func doubletapImg(gesture: UITapGestureRecognizer){
        let postion = gesture.location(in: imgView)
        zoomRectForScale(scale: ScrollView.zoomScale * 0.5, center: postion) //tap 2 lan zoom out 0.5
    }
    func zoomRectForScale(scale:CGFloat, center: CGPoint){
        var zoomRect = CGRect()
        let scrollViewSize = ScrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale   //toa do xet den
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)  //diem goc hinh anh
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        ScrollView.zoom(to: zoomRect, animated: true)
    }
    
    //MARK: UIScrollViewDelagete
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
}
