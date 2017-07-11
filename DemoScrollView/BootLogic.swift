//
//  BootLogic.swift
//  TechmasterSwiftApp
//  Techmaster Vietnam

import UIKit

class BootLogic: NSObject {
    
    var menu : [MenuSection]!
    class func boot(_ window:UIWindow){
        let basic = MenuSection(section: "Basic", menus:[
            Menu(title: "Zoom", viewClass: "ZoomImage"),
            Menu(title: "Pagination", viewClass: "Pagination"),
            ])

        let inter = MenuSection(section: "Intermediate", menus:[
            ])
        
        let advance = MenuSection(section: "Advance", menus:[           
            ])
        
        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
        mainScreen.menu = [basic, inter, advance]
        mainScreen.title = "Demo UIScrollView"
        mainScreen.about = "Written by Techmaster team"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        //nav.navigationBar.barStyle = UIBarStyle.BlackOpaque
        //nav.navigationBar.opaque = true
        window.rootViewController = nav        
      
    }   
}
