//
//  InfiniteScrollView.swift
//  DemoScrollView
//
//  Created by Kien Nguyen Duc on 7/20/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit
import AVFoundation

class InfiniteScrollView: UIViewController,UIScrollViewDelegate,AVAudioPlayerDelegate
    
    
    
{
    var soundEffect = AVAudioPlayer()
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addImage()
        scrollView.delegate = self
        
        soundEffect = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "scroll", ofType: "wav")!) as URL)
        soundEffect.delegate = self
    
        self.automaticallyAdjustsScrollViewInsets = false

    }
    
    // Khi thực hiện thao tác kéo trên màn hình thì phát ra hiệu ứng âm thanh
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        soundEffect.play()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let X = scrollView.contentOffset.x
        print(X)
        if X > 0 // Khi vuốt sang trái
        {
            //Khi scroll đến hết chiếc ảnh thứ 6
            if X >=  scrollView.frame.size.width * 6 {
                // Gọi tới chiếc ảnh thứ 2
                self.scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width , y: 0)
            }
        }
        else if X < 0 // Khi vuốt sang phải
        {
            self.scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width * 5 , y: 0)
        }
    }
    
    func addImage() {
        //Khởi tạo mảng chứa các ảnh
        var pictures:[UIImage] = [ ]
        
        //Thêm ảnh vào mảng
        pictures.append(UIImage(named: "5.png")!)
        pictures.append(UIImage(named: "1.png")!)
        pictures.append(UIImage(named: "2.png")!)
        pictures.append(UIImage(named: "3.png")!)
        pictures.append(UIImage(named: "4.png")!)
        pictures.append(UIImage(named: "5.png")!)
        pictures.append(UIImage(named: "1.png")!)
        self.scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(pictures.count), height: scrollView.frame.size.height)
        for i in 0..<pictures.count {
            var frame = CGRect()
            //Đặt điểm gốc của bức ảnh
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.origin.y = 0
            frame.size = scrollView.frame.size
            // Ẩn thanh scrollbar
            scrollView.showsHorizontalScrollIndicator = false
            let subView = UIImageView(frame: frame)
            subView.image = pictures[i]
            subView.contentMode = .scaleAspectFit
            self.scrollView.addSubview(subView)
            
        }
    }
    
}






