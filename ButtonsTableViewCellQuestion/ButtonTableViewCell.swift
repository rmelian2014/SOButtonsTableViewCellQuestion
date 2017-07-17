//
//  ButtonTableViewCell.swift
//  ButtonsTableViewCellQuestion
//
//  Created by Reinier Melian on 17/07/2017.
//  Copyright © 2017 Pruebas. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonTableViewCell: UITableViewCell {
    
    @IBInspectable var selectedColor : UIColor = UIColor.red
    @IBInspectable var normalColor : UIColor = UIColor.blue
    
    static let cellHeigth : CGFloat = 360
    
    @IBOutlet var buttonsArray: [UIButton]!
    var selectedText : String?{
        willSet{
            guard newValue != nil else{
                return
            }
            
            var foundedIndex = -1
            for (index,text) in self.texts.enumerated() {
                if(text == newValue!){
                    foundedIndex = index
                    break
                }
            }
            
            guard foundedIndex != -1 else
            {
                return
            }
            
            self.buttonsArray[foundedIndex].backgroundColor = selectedColor
        }
    }
    var texts : [String] = []
    
    var buttonActionClosure : ((_ selectedText:String?)->Void)?
    
    func setupWithClosure(texts:[String],textSelected:String?,closure:((_ selectedText:String?)->Void)?)
    {
        self.texts = texts
        
        for (index,button) in self.buttonsArray.enumerated(){
            if(self.texts.count > index)
            {
                button.setTitle(self.texts[index], for: .normal)
            }
            button.tag = index
            button.backgroundColor = self.normalColor
        }
        
        
        self.selectedText = textSelected
        if(closure != nil)
        {
            self.buttonActionClosure = closure
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func buttonAction(sender:UIButton)
    {
        if(self.texts.count > sender.tag){
            let newSelectedText = self.texts[sender.tag]
            
            if(newSelectedText != self.selectedText){
                self.selectedText = newSelectedText
            }else
            {
                self.selectedText = nil
            }
        }
        if(self.buttonActionClosure != nil)
        {
            self.buttonActionClosure!(self.selectedText)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.buttonActionClosure = nil
    }
    
}
