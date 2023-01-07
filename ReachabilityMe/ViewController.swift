//
//  ViewController.swift
//  ReachabilityMe
//
//  Created by Tomato on 2021/01/15.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - IBOutlet
	
	
	// MARK: - IBAction
	//var myTask = URLSessionDataTask()
	@IBAction func checkTapped(_ sender: UIButton) {
		checkConnectivity { (success, error) -> (Void) in
			if success {
				print("Good")
			} else {
				print("Bad")
			}
		}
	}
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
	
	deinit {
		print("deinit is called by ViewController")
	}
	
	func checkConnectivity(completionHandler: @escaping (Bool, String) -> (Void)) -> Void {
		let url = URL(string: "https://www.google.com")
		var request = URLRequest(url: url!)
		request.timeoutInterval = TimeInterval(2.0)
		let urlSessionTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let err = error as NSError? {
				if err.code == NSURLErrorTimedOut {
					//print("You have timedout!")
				}
				completionHandler(false, err.localizedDescription)
			}
			guard let httpURLResponse = response as? HTTPURLResponse else {
				//print("Ouch!")
				return
			}
			let statusCode = httpURLResponse.statusCode
			//print("Status code: \(statusCode)")
			if statusCode == 200 {
				//print("Successful!")
				completionHandler(true, "")
			} else {
				//print("Heck!")
				//self.myError = NSLocalizedString("ServerViewControllerServerError", comment: "")
				completionHandler(false, NSLocalizedString("ServerViewControllerServerError", comment: ""))
			}
		}
		urlSessionTask.resume()
	}
}

