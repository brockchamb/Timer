//
//  TimerViewController.swift
//  Timer
//
//  Created by admin on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit



class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPicker: UIPickerView!
    @IBOutlet weak var minsPicker: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var selectorStackView: UIStackView!
    @IBOutlet weak var progressBarView: UIProgressView!
    
    
    
    
    var timer = Timer()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switchToPicker()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTimerBasedViews" , name: Timer.notifySecondTick , object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timerComplete", name: Timer.notifyComplete, object: nil)
        
    }
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        toggleTimer()
    }
    
    @IBAction func pauseButtonTapped(sender: AnyObject) {
    }
    
    func switchToTimer() {
        timerLabel.hidden = false
        progressBarView.setProgress(0.0, animated: false)
        progressBarView.hidden = false
        selectorStackView.hidden = true
        startButton.setTitle("Cancel", forState: .Normal)
        
    }
    
    func switchToPicker() {
        selectorStackView.hidden = false
        timerLabel.hidden = true
        progressBarView.hidden = true
        startButton.setTitle("Start", forState: .Normal)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hoursPicker {
            return 24
        } else if pickerView == minsPicker {
            return 60
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func toggleTimer() {
        if timer.isOn {
            timer.stopTimer()
            switchToPicker()
        } else {
            switchToTimer()
        }
        
        let hours = hoursPicker.selectedRowInComponent(0)
        let minutes = minsPicker.selectedRowInComponent(0) + (hours * 60)
        let totalSecondsSetOnTimer = NSTimeInterval (minutes * 60)
        
        timer.setTimer(totalSecondsSetOnTimer, totalSeconds: totalSecondsSetOnTimer)
        updateTimerBasedViews()
        timer.startTimer()
    }
    
    func updateTimerLabel() {
        timerLabel.text = timer.string
    }
    
    func updateProgressBar() {
        
        let secondsLapsed = timer.totalSeconds - timer.seconds
        let progress = Float(secondsLapsed) / Float(timer.totalSeconds)
        progressBarView.setProgress(progress, animated: true)
    }
    
    func updateTimerBasedViews() {
        updateTimerLabel()
        updateProgressBar()
    }
    
    func timerComplete() {
        switchToPicker()
    }

    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
