//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Parth manaktala on 02/06/18.
//  Copyright © 2018 Parth manaktala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    
    var gameState = ["","","",
                     "","","",
                     "","","",""
    ]
    
    var turn : Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func win(_x : String){
        ProgressHUD.showSuccess(_x + "Wins")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func check(){
       if(gameState[1]==gameState[2] && gameState[1]==gameState[3] && (gameState[1]=="X" || (gameState[1]=="Y")))
       {
        win(_x: turnLabel.text!)
       }
    }
    func reset(){
        for i in 1...9
        {
            let tmpButton = self.view.viewWithTag(i) as? UIButton
            tmpButton?.setImage(UIImage(named: "white"), for: .normal)
            tmpButton?.isEnabled=true
        }
        for i in 1...9
        {
            gameState[i-1]=""
        }
        
    }
    
    @IBAction func resetFields(_ sender: Any) {
        reset()
    }
    
    @IBAction func buttonPessed(_ sender: UIButton) {
        let tempTag : Int = sender.tag
        let tmpButton = self.view.viewWithTag(tempTag) as? UIButton
        if turn == 0
        {
        tmpButton?.setImage(UIImage(named: "x"), for: .normal)
        tmpButton?.isEnabled=false
            gameState[tempTag]="X"
        check()
        turnLabel.text = "O's Turn"
        turn=1
        }
        else
        {
        tmpButton?.setImage(UIImage(named: "tic-tac-toe-O"), for: .normal)
        tmpButton?.isEnabled=false
            gameState[tempTag]="O"
        check()
        turnLabel.text = "X's Turn"
        turn=0
        }
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        reset()
    }
}
