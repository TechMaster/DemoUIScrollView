//
//  ZoomVC.swift
//  DemoScrollView
//
//  Created by cuong on 7/11/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class ZoomVC: UIViewController,UIScrollViewDelegate {
    
    //var photo = UIImageView()
    var photo: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Cuong: chỉ cần nên dùng một biến trỏ tới UIImageView thôi
        //let imgView = UIImageView(image: UIImage(named: "miss2.jpg"))
        photo = UIImageView(image: UIImage(named: "miss2.jpg"))
        photo.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        photo.contentMode = .scaleAspectFit
        scrollView.contentSize = CGSize(width: photo.bounds.width, height: photo.bounds.height)
        //photo = imgView
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        scrollView.delegate = self
        self.scrollView.addSubview(photo)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    
}
