//
//  ButtonTableViewCell.swift
//  ButtonsTableViewCellQuestion
//
//  Created by Reinier Melian on 17/07/2017.
//  Copyright © 2017 Pruebas. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    var selectedState : Bool = false
    
    var buttonActionClosure : ((_ selectedState:Bool)->Void)?
    
    func setupWithClosure(selected:Bool,closure:((_ selectedState:Bool)->Void)?)
    {
        self.selectedState = selected
        if(closure != nil)
        {
            self.buttonActionClosure = closure
        }
        
        self.button.backgroundColor = UIColor.blue
        if(self.selectedState)
        {
            self.button.backgroundColor = UIColor.red
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
    
    @IBAction func buttonAction(sender:Any)
    {
        self.selectedState = !self.selectedState
        if(self.buttonActionClosure != nil)
        {
            self.buttonActionClosure!(self.selectedState)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.buttonActionClosure = nil
    }

}
