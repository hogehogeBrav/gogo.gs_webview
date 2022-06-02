//
//  ViewController.swift
//  gogo.gs_webview
//
//  Created by Makoto Miyahara on 2022/06/03.
//

import UIKit
import WebKit

class ViewController: UIViewController , UITabBarDelegate{

  @IBOutlet weak var webview: WKWebView!
  @IBOutlet weak var tabbar: UITabBar!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabbar.delegate = self
    // Do any additional setup after loading the view.
    let url = URL(string: "https://gogo.gs/")
    let request = URLRequest(url: url!)
    webview.load(request)
  }
  
  @IBAction func backButton(_ sender: Any) {
    if(webview.canGoBack){
        webview.goBack()
    }
  }
  
  @IBAction func forwardButton(_ sender: Any) {
    if(webview.canGoForward){
        webview.goForward()
    }
  }
  
  
  func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         switch item.tag {
         case 0:
           let url = URL(string: "https://gogo.gs/")
           let request = URLRequest(url: url!)
           webview.load(request)
         case 1:
           let url = URL(string: "https://gogo.gs/ranking/average/")
           let request = URLRequest(url: url!)
           webview.load(request)
         case 2:
           let url = URL(string: "https://gogo.gs/chart/")
           let request = URLRequest(url: url!)
           webview.load(request)
         case 3:
           let url = URL(string: "https://gogo.gs/nearby/")
           let request = URLRequest(url: url!)
           webview.load(request)
         case 4:
           let url = URL(string: "https://gogo.gs/map/?gps=1")
           let request = URLRequest(url: url!)
           webview.load(request)
         default:break
         }
  }
}
