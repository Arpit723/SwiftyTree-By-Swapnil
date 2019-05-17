//
//  ListDoc+TableView.swift
//  DemoAimcor
//
//  Created by Swapnil Patel on 22/03/19.
//  Copyright © 2019 Bhaumik Kothari. All rights reserved.
//

import Foundation

import UIKit

extension TreeViewController : UITableViewDelegate ,UITableViewDataSource
{
    
    

    func setUpTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let nibNameLoad = UINib(nibName: "TreeViewCell", bundle: nil)
        tableView.register(nibNameLoad, forCellReuseIdentifier: "TreeViewCell")
        self.view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.tableView.backgroundColor =  UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        self.tableView.reloadData()
        
        
    }
    
    
    //MARK:  Table View Methods
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 50.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //   print(displayArray.count)
        return displayArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let node: TreeViewNode = self.displayArray[indexPath.row]
        
        let cell  = (self.tableView.dequeueReusableCell(withIdentifier: "TreeViewCell") as! TreeViewCell)
        
        cell.treeNode = node
        cell.treeLabel.text = node.nodeObject as! String?
        
        if node.nodeChildren != nil{
            if (node.isExpanded == GlobalVariables.TRUE)
            {
                cell.setTheButtonBackgroundImage(backgroundImage: UIImage(named: "whiteOpen")!)
            }
            else
            {
                cell.setTheButtonBackgroundImage(backgroundImage: UIImage(named: "whiteClose")!)
            }
        }else{
            
            cell.setTheButtonBackgroundImage(backgroundImage: UIImage())
        }
        
        
        cell.setNeedsDisplay()
        
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let node: TreeViewNode = self.displayArray[indexPath.row]
    //
    //
    //    }
}
