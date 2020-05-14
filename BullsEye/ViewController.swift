//
//  ViewController.swift
//  BullsEye
//
//  Created by Hau Lam on 9/5/20.
//  Copyright © 2020 Hau Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider : UISlider!;
    @IBOutlet weak var targetLabel : UILabel!;
    @IBOutlet weak var scoreLabel : UILabel!;
    @IBOutlet weak var roundLabel : UILabel!;
    
    var currentValue : Int = 0;
    var targetValue : Int = 0;
    var score: Int = 0;
    var round: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound();
        startOver();
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!;
        slider.setThumbImage(thumbImageNormal, for: .normal);
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!;
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted);
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14);
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!;
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets);
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal);
        let trackRightImage = UIImage(named: "SliderTrackRight")!;
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets);
        slider.setMaximumTrackImage(trackRightResizable, for: .normal);
        
    }

    @IBAction func showAlert() {
        round += 1;
        let different = abs(targetValue - currentValue);
        var points = 100 - different;
        score += points;
        
        
        let title: String;
        if different == 0 {
            title = "Perfect!";
            points += 100;
        } else if different < 5 {
            title = "You almost had it!"
            if different == 1 {
                points += 50;
            }
        } else if different < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        
        let message = "You scored \(points) points";
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound();
        });
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
    }
    
    @IBAction func sliderMoved (_ slider : UISlider) {
        currentValue = lroundf(slider.value);
    }
    
    @IBAction func startOver() {
        round = 0;
        score = 0;
        updateLabel();
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100);
        currentValue = 50;
        slider.value = Float(currentValue);
        updateLabel();
        
        let transition = CATransition();
        transition.type = CATransitionType.fade;
        transition.duration = 1;
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut);
        view.layer.add(transition, forKey: nil);
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue);
        scoreLabel.text = String(score);
        roundLabel.text = String(round);
    }
}

