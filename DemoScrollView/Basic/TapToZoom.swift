//
//  SingleAndDouble.swift
//  DemoScrollView
//
//  Created by techmaster on 7/11/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class TapToZoom: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    var photo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgView = UIImageView(image: UIImage(named:"varus.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width: scrollview.frame.size.width, height: scrollview.frame.size.height)
        imgView.isUserInteractionEnabled  = true
        imgView.isMultipleTouchEnabled = true //double kick
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(gesture:)))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapImg(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        tap.require(toFail: doubleTap)
        imgView.addGestureRecognizer(doubleTap)
        imgView.contentMode = .scaleAspectFit
        photo = imgView
        scrollview.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
        scrollview.minimumZoomScale = 1
        scrollview.maximumZoomScale = 5
        self.scrollview.addSubview(imgView)
        scrollview.delegate = self
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return photo
    }
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollview.zoomScale * 1.5, center: position)
        
    }
    func doubleTapImg(gesture: UITapGestureRecognizer){
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollview.zoomScale * 0.5, center: position)
    }
    func zoomRectForScale(scale: CGFloat, center: CGPoint)
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollview.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        scrollview.zoom(to: zoomRect, animated: true)
    }
    
}
