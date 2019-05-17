//
//  GlobalVariables.swift
//  SwiftyTree
//
//  Created by Ravi Chokshi on 17/05/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import UIKit


class TreeViewCell: UITableViewCell
{
    
    //MARK:  Properties & Variables
    
    @IBOutlet weak var indiImage: UIImageView!
    @IBOutlet weak var treeButton: UIButton!
    @IBOutlet weak var treeLabel: UILabel!
    var treeNode: TreeViewNode!
    
    
    //MARK:  Draw Rectangle for Image
    
    override func draw(_ rect: CGRect) {
        var cellFrame: CGRect = self.treeLabel.frame
        var buttonFrame: CGRect = self.indiImage.frame
        let indentation: Int = self.treeNode.nodeLevel! * 25
        cellFrame.origin.x = buttonFrame.size.width + CGFloat(indentation) + 8
        buttonFrame.origin.x = 5 + CGFloat(indentation)
        self.treeLabel.frame = cellFrame
        self.indiImage.frame = buttonFrame
    }
    
    //MARK:  Set Background image
    
    func setTheButtonBackgroundImage(backgroundImage: UIImage)
    {
        //  self.treeButton.setBackgroundImage(backgroundImage, for: .normal)
        self.indiImage.image = backgroundImage
    }
    
    //MARK:  Expand Node
    
    @IBAction func expand(sender: AnyObject)
    {
        if (self.treeNode != nil)
        {
            if self.treeNode.nodeChildren != nil
            {
                if self.treeNode.isExpanded == GlobalVariables.TRUE
                {
                    self.treeNode.isExpanded = GlobalVariables.FALSE
                }
                else
                {
                    self.treeNode.isExpanded = GlobalVariables.TRUE
                }
            }
            else
            {
                self.treeNode.isExpanded = GlobalVariables.FALSE
            }
            
            self.isSelected = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TreeNodeButtonClicked"), object: self)
            //print("button clicked")
        }
    }
}
