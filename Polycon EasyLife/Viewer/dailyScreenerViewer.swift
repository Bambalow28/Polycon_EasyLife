//
//  dailyScreenerViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-05.
//

import UIKit

class dailyScreenerViewer: UIViewController {

    @IBOutlet weak var feverChills: UISegmentedControl!
    @IBOutlet weak var difficultBreathing: UISegmentedControl!
    @IBOutlet weak var cough: UISegmentedControl!
    @IBOutlet weak var soreThroat: UISegmentedControl!
    @IBOutlet weak var runnyNose: UISegmentedControl!
    @IBOutlet weak var lossOfSmell: UISegmentedControl!
    @IBOutlet weak var nauseaVomiting: UISegmentedControl!
    @IBOutlet weak var notFeelingWell: UISegmentedControl!
    @IBOutlet weak var travelOutsideCanada: UISegmentedControl!
    @IBOutlet weak var contactConfirmed: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    
    var screenerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Daily Screener"
        
        feverChills.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        difficultBreathing.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        cough.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        soreThroat.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        runnyNose.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        lossOfSmell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        nauseaVomiting.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        notFeelingWell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        travelOutsideCanada.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        contactConfirmed.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        
        submitBtn.layer.cornerRadius = 10
        submitBtn.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        submitBtn.layer.shadowRadius  = 8
        submitBtn.layer.shadowOpacity = 0.2
        submitBtn.clipsToBounds       = true
        submitBtn.layer.masksToBounds = false
        
    }
    
    @IBAction func feverChillsAnswer(_ sender: Any) {
        switch feverChills.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1

                feverChills.selectedSegmentTintColor = UIColor.systemRed
                feverChills.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:

                feverChills.selectedSegmentTintColor = UIColor.systemGreen
                feverChills.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func difficultBreathingAnswer(_ sender: Any) {
        switch difficultBreathing.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                difficultBreathing.selectedSegmentTintColor = UIColor.systemRed
                difficultBreathing.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                difficultBreathing.selectedSegmentTintColor = UIColor.systemGreen
                difficultBreathing.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func coughAnswer(_ sender: Any) {
        switch cough.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                cough.selectedSegmentTintColor = UIColor.systemRed
                
                cough.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                cough.selectedSegmentTintColor = UIColor.systemGreen
                cough.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func soreThroatAnswer(_ sender: Any) {
        switch soreThroat.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                soreThroat.selectedSegmentTintColor = UIColor.systemRed
                soreThroat.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                soreThroat.selectedSegmentTintColor = UIColor.systemGreen
                soreThroat.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                missingAnswer()
            }
    }
    
    @IBAction func runnyNoseAnswer(_ sender: Any) {
        switch runnyNose.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                runnyNose.selectedSegmentTintColor = UIColor.systemRed
                runnyNose.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                runnyNose.selectedSegmentTintColor = UIColor.systemGreen
                runnyNose.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func lossOfSmell(_ sender: Any) {
        switch lossOfSmell.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                lossOfSmell.selectedSegmentTintColor = UIColor.systemRed
                lossOfSmell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                lossOfSmell.selectedSegmentTintColor = UIColor.systemGreen
                lossOfSmell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func nauseaVomitingAnswer(_ sender: Any) {
        switch nauseaVomiting.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                nauseaVomiting.selectedSegmentTintColor = UIColor.systemRed
                nauseaVomiting.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                nauseaVomiting.selectedSegmentTintColor = UIColor.systemGreen
                nauseaVomiting.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func notFeelingWellAnswer(_ sender: Any) {
        switch notFeelingWell.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                notFeelingWell.selectedSegmentTintColor = UIColor.systemRed
                notFeelingWell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                notFeelingWell.selectedSegmentTintColor = UIColor.systemGreen
                notFeelingWell.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func travelOutsideCanadaAnswer(_ sender: Any) {
        switch travelOutsideCanada.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                travelOutsideCanada.selectedSegmentTintColor = UIColor.systemRed
                travelOutsideCanada.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                travelOutsideCanada.selectedSegmentTintColor = UIColor.systemGreen
                travelOutsideCanada.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func contactConfirmedAnswer(_ sender: Any) {
        switch contactConfirmed.selectedSegmentIndex
            {
            case 0:
                screenerCount += 1
                
                contactConfirmed.selectedSegmentTintColor = UIColor.systemRed
                contactConfirmed.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            case 1:
                contactConfirmed.selectedSegmentTintColor = UIColor.systemGreen
                contactConfirmed.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            default:
                break
            }
    }
    
    @IBAction func questionClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Daily Screener FAQ", message: "Dear Magna Employee, To ensure safety of each and every person we are required to tighten restrictions into workplace by having mandatory Screener which also acts as your clock in for the day.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay, Thanks", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        transitionToLogin()
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        transitionToScreenerResult()
        print(screenerCount)
    }
    
    func transitionToScreenerResult() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dailyScreenerResultController = storyBoard.instantiateViewController(withIdentifier: "dailyScreenerResult") as! dailyScreenerResult
        
        dailyScreenerResultController.resultNum = screenerCount

        let navController = UINavigationController(rootViewController: dailyScreenerResultController)
        
        navController.modalPresentationStyle = .automatic
        navController.modalTransitionStyle = .coverVertical
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func missingAnswer() {
        let alert = UIAlertController(title: "Error", message: "Looks like you missed Something!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
