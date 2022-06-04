//
//  ViewController.swift
//  gogo.gs_webview
//
//  Created by Makoto Miyahara on 2022/06/03.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITabBarDelegate{

  @IBOutlet weak var webview: WKWebView!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var tabbar: UITabBar!
  
  private var observation: NSKeyValueObservation?
  private var colorCnt = 0
  private let colorArray: [UIColor] = [
    .systemBlue,
    .systemBlue
  ]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabbar.delegate = self
    // Do any additional setup after loading the view.
    let url = URL(string: "https://gogo.gs/")
    let request = URLRequest(url: url!)
    webview.load(request)
    
    // ProgressBar
    progressView.progressTintColor = colorArray[colorCnt]
    colorCnt = colorCnt + 1
    
    observation = webview.observe(\.estimatedProgress, options: .new){_, change in
      print("progress=\(String(describing: change.newValue))")
      self.progressView.setProgress(Float(change.newValue!), animated: true)
      
      if change.newValue! >= 1.0 {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseIn],
                       animations: {
                        self.progressView.alpha = 0.0
        }, completion: { (finished: Bool) in
          self.progressView.progressTintColor = self.colorArray[self.colorCnt]
          self.colorCnt = self.colorCnt + 1
          if self.colorCnt >= self.colorArray.count {
            self.colorCnt = 0
          }
          self.progressView.setProgress(0, animated: false)
        })
      }
      else {
        self.progressView.alpha = 1.0
      }
    }
    
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
