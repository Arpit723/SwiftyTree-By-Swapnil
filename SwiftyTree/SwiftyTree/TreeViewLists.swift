//
//  TreeViewLists.swift
//  TreeView1
//
//  Created by Cindy Oakes on 5/21/16.
//  Copyright © 2016 Cindy Oakes. All rights reserved.
//

class TreeViewLists
{
    //MARK:  Load Array With Initial Data 
    
    static func LoadInitialData() -> [TreeViewData]
    {
        var data: [TreeViewData] = []
        data.append(TreeViewData(level: 0, name: "Food", id: "1", parentId: "0")!)
        data.append(TreeViewData(level: 0, name: "movie", id: "2", parentId: "0")!)
        data.append(TreeViewData(level: 1, name: "Food1", id: "3", parentId: "1")!)
        data.append(TreeViewData(level: 1, name: "Food2", id: "4", parentId: "1")!)
        data.append(TreeViewData(level: 2, name: "Food3", id: "5", parentId: "3")!)
        data.append(TreeViewData(level: 2, name: "Food4", id: "6", parentId: "3")!)
        data.append(TreeViewData(level: 1, name: "Food5", id: "7", parentId: "2")!)
        data.append(TreeViewData(level: 1, name: "Food6", id: "8", parentId: "2")!)
        data.append(TreeViewData(level: 1, name: "Food7", id: "9", parentId: "2")!)
        data.append(TreeViewData(level: 2, name: "Food8", id: "10", parentId: "4")!)
        data.append(TreeViewData(level: 2, name: "Food9", id: "11", parentId: "4")!)
        data.append(TreeViewData(level: 2, name: "movie1", id: "12", parentId: "4")!)
        data.append(TreeViewData(level: 3, name: "movie2", id: "13", parentId: "5")!)
        data.append(TreeViewData(level: 3, name: "movie3", id: "14", parentId: "6")!)

        
        return data
    }
    
    //MARK:  Load Nodes From Initial Data
    
    static func LoadInitialNodes(dataList: [TreeViewData]) -> [TreeViewNode]
    {
        var nodes: [TreeViewNode] = []
        
        for data in dataList where data.level == 0
        {
             print("\(data.name)")
            
            let node: TreeViewNode = TreeViewNode()
            node.nodeLevel = data.level
            node.nodeObject = data.name as AnyObject 
            node.isExpanded = GlobalVariables.TRUE
            let newLevel = data.level + 1
            node.nodeChildren = LoadChildrenNodes(dataList: dataList, level: newLevel, parentId: data.id)
            
            if (node.nodeChildren?.count == 0)
            {
                node.nodeChildren = nil
            }
            
            nodes.append(node)
         
        }
        
        return nodes
    }
    
    //MARK:  Recursive Method to Create the Children/Grandchildren....  node arrays
    
    static func LoadChildrenNodes(dataList: [TreeViewData], level: Int, parentId: String) -> [TreeViewNode]
    {
        var nodes: [TreeViewNode] = []
        
        for data in dataList where data.level == level && data.parentId == parentId
        {
            print("\(data.name)")
            
            let node: TreeViewNode = TreeViewNode()
            node.nodeLevel = data.level
            node.nodeObject = data.name as AnyObject
            node.isExpanded = GlobalVariables.FALSE
            let newLevel = level + 1
            node.nodeChildren = LoadChildrenNodes(dataList: dataList, level: newLevel, parentId: data.id)
            
            if (node.nodeChildren?.count == 0)
            {
                node.nodeChildren = nil
            }
            
            nodes.append(node)
            
        }
        
        return nodes
    }
    
    
}
