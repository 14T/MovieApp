//
//  BookingViewController.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import UIKit
import SVProgressHUD

class BookingViewController: UIViewController, StoryboardInitable {

  @IBOutlet weak var webView: UIWebView!
  static var storyboardName = "Main"

    override func viewDidLoad() {
        super.viewDidLoad()
      
      webView.delegate = self
      if let url = URL(string: Constants.Config.bookingUrl) {
        let request = URLRequest(url: url)
        webView.loadRequest(request)
      }
    }


}

extension BookingViewController : UIWebViewDelegate{
  func webViewDidStartLoad(_ webView: UIWebView) {
    SVProgressHUD.show()
  }
  
  func webViewDidFinishLoad(_ webView: UIWebView) {
    SVProgressHUD.dismiss()
  }
}
