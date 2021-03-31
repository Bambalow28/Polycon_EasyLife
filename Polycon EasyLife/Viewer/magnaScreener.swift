//
//  magnaScreener.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2021-02-14.
//

import UIKit
import WebKit

class magnaScreener: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Magna Screener";
        
        webView.layer.cornerRadius = 10;
        
        let url = URL(string: "https://magnascreening.powerappsportals.com/en-US/");
        let request = URLRequest(url: url!);
        webView.load(request);
    }

    @IBAction func refreshClicked(_ sender: Any) {
        let url = URL(string: "https://magnascreening.powerappsportals.com/en-US/");
        let request = URLRequest(url: url!);
        webView.load(request);
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        print("Sent Clicked");
    }
    
    @IBAction func automateClicked(_ sender: Any) {
        
        //Click Agree Button
        webView.evaluateJavaScript("document.querySelector('body > div.page-copy > div > div > div > table > tbody > tr > td > div > div > a.btn.btn-primary.button').click()");
            
            //Select Country Search Button
            let secTwo = 2.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwo) {
                self.webView.evaluateJavaScript("document.querySelector('#EntityFormView > div.tab.clearfix > div > div > fieldset:nth-child(1) > table > tbody > tr > td.clearfix.cell.lookup.form-control-cell > div.control > div.input-group > div.input-group-btn > button.btn.btn-default.launchentitylookup > span.fa.fa-search').click()");
            }
            
            //Select Canada
            let secThree = 3.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secThree) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_countrylookup_lookupmodal > div > section > div > div > div.modal-body > div.entity-grid > div.view-grid.has-pagination > table > tbody > tr:nth-child(5) > td:nth-child(1)').click()");
            }
            
            //Click 'Select'
            let secFour = 4.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secFour) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_countrylookup_lookupmodal > div > section > div > div > div.modal-footer > button.primary.btn.btn-primary').click()");
            }
            
            //Select Location Search Button
            let secFive = 5.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secFive) {
                self.webView.evaluateJavaScript("document.querySelector('#EntityFormView > div.tab.clearfix > div > div > fieldset:nth-child(2) > table > tbody > tr > td.clearfix.cell.lookup.form-control-cell > div.control > div.input-group > div.input-group-btn > button.btn.btn-default.launchentitylookup > span.fa.fa-search').click()");
            }
            
            //Select Page 4
            let secSix = 7.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secSix) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_divisionlookup_lookupmodal > div > section > div > div > div.modal-body > div.entity-grid > div.view-pagination > div > ul > li:nth-child(5) > a').click()");
            }
            
            //Select Polycon
            let secSeven = 8.5;
            DispatchQueue.main.asyncAfter(deadline: .now() + secSeven) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_divisionlookup_lookupmodal > div > section > div > div > div.modal-body > div.entity-grid > div.view-grid.has-pagination > table > tbody > tr:nth-child(10) > td:nth-child(2)').click()");
            }
            
            //Click 'Select'
            let secEight = 9.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secEight) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_divisionlookup_lookupmodal > div > section > div > div > div.modal-footer > button.primary.btn.btn-primary').click()");
            }
            
            //Next
            let secNine = 10.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secNine) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }
            
            //Input First Name
            let secEleven = 13.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secEleven) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_who_field2').value = 'Joshua';")
            }
            
            //Input Last Name
            let secTwelve = 13.5
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwelve) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_who_field3').value = 'Alanis';")
            }
            
            //Input Mobile Number
            let secThirteen = 14.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secThirteen) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_who_field4').value = '2269797607';")
            }
            
            //Input Badge Number
            let secFourteen = 14.5
            DispatchQueue.main.asyncAfter(deadline: .now() + secFourteen) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_who_field5').value = '5586';")
            }
            
            //Next
            let secFifteen = 15.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secFifteen) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }
            
            //Choose 'None of the Above'
            let secSixteen = 20.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secSixteen) {
                self.webView.evaluateJavaScript("document.getElementById('cr3e3_symptoms_dsplyordr_9').checked = true;");
            }
            
            //Next
            let secSeventeen = 21.0
            DispatchQueue.main.asyncAfter(deadline: .now() + secSeventeen) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }
            
            //Choose 'No'
            let secEighteen = 26.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secEighteen) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_temperaturetoday_1').checked = true");
            }
            
            //Next
            let secNineteen = 26.5;
            DispatchQueue.main.asyncAfter(deadline: .now() + secNineteen) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }
            
            //Choose 'No'
            let secTwenty = 31.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwenty) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_closecontact_1').checked = true");
            }
            
            //Next
            let secTwentyOne = 31.5;
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwentyOne) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }
            
            //Choose 'No'
            let secTwentyTwo = 36.0;
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwentyTwo) {
                self.webView.evaluateJavaScript("document.querySelector('#cr3e3_selfisolationorder_1').checked = true");
            }
            
            //Next
            let secTwentyThree = 36.5;
            DispatchQueue.main.asyncAfter(deadline: .now() + secTwentyThree) {
                self.webView.evaluateJavaScript("document.querySelector('#NextButton').click()")
            }

        }
}
