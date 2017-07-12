//
//  ZoomVC.swift
//  DemoScrollView
//
//  Created by cuong on 7/11/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class ZoomVC: UIViewController,UIScrollViewDelegate {
    
    var photo = UIImageView()


    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView(image: UIImage(named: "miss2.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        imgView.contentMode = .scaleAspectFit
        scrollView.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
        photo = imgView
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        scrollView.delegate = self
        self.scrollView.addSubview(imgView)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    
}
