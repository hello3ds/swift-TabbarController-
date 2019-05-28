//
//  MainTabbarViewController.swift
//  SwiftTabbarController
//
//  Created by Shirley on 2019/5/28.
//  Copyright © 2019 Shirley. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildVCWithImg(childVC: HomeViewController(), childTitle: "首页", imageName: "tabbar_weixin_normal", selectedImageName: "tabbar_weixin_selected", index: 0)
        self.addChildVCWithImg(childVC: RecommandViewController(), childTitle: "推荐", imageName: "tabbar_weibo_normal", selectedImageName: "tabbar_weibo_selected", index: 1)
        self.addChildVCWithImg(childVC: MessageViewController(), childTitle: "消息", imageName: "tabbar_friends_normal", selectedImageName: "tabbar_friends_selected", index: 2)
        self.addChildVCWithImg(childVC: MineViewController(), childTitle: "我的", imageName: "tabbar_kongjian_normal", selectedImageName: "tabbar_kongjian_selected", index: 3)
        
        self.modifyTabbar()
        // Do any additional setup after loading the view.
    }
    
    

    private func addChildVCWithImg(childVC: UIViewController, childTitle: NSString, imageName: NSString, selectedImageName: NSString, index: Int){
        let navigation = UINavigationController(rootViewController: childVC)
        childVC.title = childTitle as String
        childVC.tabBarItem.tag = index
        childVC.tabBarItem.image = UIImage(named: imageName as String)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName as String)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
        
    }

    
    /// 修改原生tabbar
    func modifyTabbar() -> Void {
        //设置选中字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(red: 247/255.0, green: 195/255.0, blue: 55/255.0, alpha: 1),NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)], for: UIControl.State.selected)
        //设置未选中状态下字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)], for: UIControl.State.normal)
        
        
        //因为tabbar有默认的渲染色，所以要先去掉，否则颜色并不是我们想要的颜色
        UITabBar.appearance().isTranslucent = false
        //之后再设置tabbar的背景色
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.8876147866, green: 0.9399324059, blue: 0.969196856, alpha: 1)
        //下面这个方法可以取消掉htabbar上的灰色线 两个都要写上，缺一不可
        UITabBar.appearance().shadowImage = UIImage.init()
        UITabBar.appearance().backgroundImage = UIImage.init()
        
    }
    /// 这个方法用于设置自定义tabbar
    func loadCustomTabbar() -> Void {
        //先隐藏原生tabbar
        self.tabBar.isHidden = true
        //自定义tabbar
        let lblBG = UILabel.init(frame: CGRect.init(x: 0, y: self.view.frame.height - self.tabBar.frame.height, width: self.view.frame.width, height: self.tabBar.frame.height))
        lblBG.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        self.view.addSubview(lblBG)
        
    }
    
    /// 添加子控制器文字图片
    private func addChildVCWithFontImg(childVC: UIViewController, childTitle: String, fontImg: UIImage, selectImg:UIImage, index: Int)
    {
        let navigation = UINavigationController(rootViewController: childVC)
        
        childVC.title = childTitle
        childVC.tabBarItem.tag = index
        childVC.tabBarItem.image = fontImg.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectImg.withRenderingMode(.alwaysOriginal)
        
        self.addChild(navigation)
    }
    /// 为tabbar增加子控制器
    ///
    /// - Parameters:
    ///   - child: 子控制器
    ///   - title: 主标题
    ///   - normalImg: 未选中状态下的图片
    ///   - selectImg: 选中状态下的图片
    ///   - index: 排序
    func addChildVC(child:UIViewController, title:String, normalImg:UIImage, selectImg:UIImage, index:Int) -> Void {
        let childVC = UINavigationController.init(rootViewController: child)
        childVC.title = title
        childVC.tabBarItem.image = normalImg.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectImg.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.tag = index
        self.addChild(childVC)
    }
    
}
