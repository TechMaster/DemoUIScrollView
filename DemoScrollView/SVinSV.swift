//
//  SVinSV.swift
//  DemoScrollView
//
//  Created by Kien Nguyen Duc on 7/21/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class SVinSV: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        //Scroll ngang
        let horizontalScrollView = UIScrollView(frame: CGRect(x: 0, y: view.bounds.size.height / 2 - 150, width: view.bounds.size.width, height: 300))
        //        horizontalScrollView.backgroundColor = UIColor.lightGray
        horizontalScrollView.contentSize = CGSize(width: view.bounds.size.width * 3, height: 300)
        horizontalScrollView.isPagingEnabled = true
        horizontalScrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(horizontalScrollView)
        
        
        
        //Scroll dọc 1
        let verticalScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 220))
        //                verticalScrollView.backgroundColor = UIColor.green
        verticalScrollView.contentSize = CGSize(width: view.bounds.size.width, height: 880)
        verticalScrollView.isPagingEnabled = true
        horizontalScrollView.addSubview(verticalScrollView)
        
        var pictures:[UIImage] = [ ]
        pictures.append(UIImage(named: "1.jpg")!)
        pictures.append(UIImage(named: "12.jpg")!)
        pictures.append(UIImage(named: "13.jpg")!)
        pictures.append(UIImage(named: "14.jpg")!)
        for i in 0..<pictures.count {
            var frame = CGRect()
            frame.origin.x = 0
            frame.origin.y = verticalScrollView.frame.size.height * CGFloat(i)
            frame.size = verticalScrollView.frame.size
            let subView = UIImageView(frame: frame)
            subView.image = pictures[i]
            subView.contentMode = .scaleAspectFit
            verticalScrollView.addSubview(subView)
        }
        
        
        // Scroll dọc 2
        let verticalScrollView2 = UIScrollView(frame: CGRect(x:verticalScrollView.frame.size.width, y: 0, width: view.bounds.size.width, height: 220))
        //            verticalScrollView2.backgroundColor = UIColor.red
        verticalScrollView2.contentSize = CGSize(width: 220, height: 880)
        verticalScrollView2.isPagingEnabled = true
        
        horizontalScrollView.addSubview(verticalScrollView2)
        
        var pictures2:[UIImage] = [ ]
        pictures2.append(UIImage(named: "2.jpg")!)
        pictures2.append(UIImage(named: "22.jpg")!)
        pictures2.append(UIImage(named: "23.jpg")!)
        pictures2.append(UIImage(named: "24.jpg")!)
        for i in 0..<pictures2.count {
            var frame = CGRect()
            frame.origin.x = 0
            frame.origin.y = verticalScrollView.frame.size.height * CGFloat(i)
            frame.size = verticalScrollView.frame.size
            let subView2 = UIImageView(frame: frame)
            subView2.image = pictures2[i]
            subView2.contentMode = .scaleAspectFit
            verticalScrollView2.addSubview(subView2)
        }
        
        
        // Scroll dọc 3
        let verticalScrollView3 = UIScrollView(frame: CGRect(x:view.bounds.size.width * 2 , y: 0, width: view.bounds.size.width, height: 220))
        // verticalScrollView3.backgroundColor = UIColor.blue
        verticalScrollView3.contentSize = CGSize(width: 220, height: 880)
        verticalScrollView3.isPagingEnabled = true
        horizontalScrollView.addSubview(verticalScrollView3)
        
        var pictures3:[UIImage] = [ ]
        pictures3.append(UIImage(named: "3.jpg")!)
        pictures3.append(UIImage(named: "32.jpg")!)
        pictures3.append(UIImage(named: "33.jpg")!)
        pictures3.append(UIImage(named: "34.jpg")!)
        for i in 0..<pictures3.count {
            var frame = CGRect()
            frame.origin.x = 0
            frame.origin.y = verticalScrollView.frame.size.height * CGFloat(i)
            frame.size = verticalScrollView.frame.size
            let subView3 = UIImageView(frame: frame)
            subView3.image = pictures3[i]
            subView3.contentMode = .scaleAspectFit
            verticalScrollView3.addSubview(subView3)
        }
        
        
    }
}
