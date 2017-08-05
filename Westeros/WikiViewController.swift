//
//  WikiViewController.swift
//  Westeros
//
//  Created by Gema on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    //let model : House
    
    let titleView : String
    let wikiURL : URL
    
    @IBOutlet weak var browserView: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
//    init(model: House){
//        self.model = model
//        super.init(nibName:nil, bundle: nil)
//    }
    
    init(titleView: String, wikiURL: URL){
        self.titleView = titleView
        self.wikiURL = wikiURL
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        activityView.isHidden = false
        activityView.startAnimating()
        title = self.titleView
        // asignamos como delegado a sí mismo
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: self.wikiURL))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
    }
    
}

extension WikiViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView){
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    // con este método bloqueamos la navegación "fuera" de nuestra url
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == .linkClicked) ||
            (navigationType == .formSubmitted){
            return false
        } else {
            return true
        }
    }
    
    // cargar el metodo si falla la carga!

}
