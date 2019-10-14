

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var segmentedControlOutlet: UISegmentedControl!
    
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.google.com"
        let mainUrl = URL(string: urlString)
        let mainUrlRequest = URLRequest(url: mainUrl!)
        mainWebView.load(mainUrlRequest)
        urlTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var myUrlString = urlTextField.text!
        if !myUrlString.hasPrefix("https://") {
            myUrlString = "https://\(myUrlString)"
        }
        let mainUrl = URL(string: myUrlString)
        let mainUrlRequest = URLRequest(url: mainUrl!)
        mainWebView.load(mainUrlRequest)
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        let urlString = segmentedControlOutlet.titleForSegment(at: segmentedControlOutlet.selectedSegmentIndex)
        let myUrl = URL(string: "https://www.\(urlString!).com")
        let urlRequest = URLRequest(url: myUrl!)
        mainWebView.load(urlRequest)
    }
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func rewindAction(_ sender: UIBarButtonItem) {
        mainWebView.goBack()
    }
    
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        mainWebView.goForward()
    }
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        mainWebView.stopLoading()
    }
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }
}

