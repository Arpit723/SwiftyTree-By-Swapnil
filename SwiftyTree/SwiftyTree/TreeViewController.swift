//
//  ViewController.swift
//  TreeView1
//
//  Created by Cindy Oakes on 5/19/16.
//  Copyright © 2016 Cindy Oakes. All rights reserved.
//

import UIKit

class TreeViewController: UIViewController
{
    
    
    //MARK: Properties & Variables

    var tableView = UITableView()
    
    var displayArray = [TreeViewNode]()
    var indentation: Int = 0
    var nodes: [TreeViewNode] = []
    var data: [TreeViewData] = []
    
    
    //MARK:  Init & Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        NotificationCenter.default.addObserver(self, selector: #selector(self.ExpandCollapseNode), name: NSNotification.Name(rawValue: "TreeNodeButtonClicked"), object: nil)
        data = TreeViewLists.LoadInitialData()
        print(data)
        //for i in 0..<data.count
        //{
        //    let d: TreeViewData = data[i]
        //    print("\(d.name)")
        //}

        nodes = TreeViewLists.LoadInitialNodes(dataList: data)
        print(nodes)
        self.LoadDisplayArray()
        setUpTableView()
        self.tableView.reloadData()
        
        }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:  Node/Data Functions
    
    @objc func ExpandCollapseNode(notification: NSNotification)
    {
        self.LoadDisplayArray()
        self.tableView.reloadData()
    }
    
    
    func LoadDisplayArray()
    {
        self.displayArray = [TreeViewNode]()
        for node: TreeViewNode in nodes
        {
            self.displayArray.append(node)
          if (node.isExpanded == GlobalVariables.TRUE)
           {
                self.AddChildrenArray(childrenArray: node.nodeChildren as! [TreeViewNode])
            }
        }
    }
    
    func AddChildrenArray(childrenArray: [TreeViewNode])
    {
        for node: TreeViewNode in childrenArray
        {
            self.displayArray.append(node)
            if (node.isExpanded == GlobalVariables.TRUE )
          {
                if (node.nodeChildren != nil)
                {
                    self.AddChildrenArray(childrenArray: node.nodeChildren as! [TreeViewNode])
                }
           }
        }
    }




}

