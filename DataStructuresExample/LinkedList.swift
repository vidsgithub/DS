//
//  LinkedList.swift
//  DataStructuresExample
//
//  Created by Shingade on 3/9/18.
//  Copyright © 2018 com.orgname.ds. All rights reserved.
//

import Foundation

class SingleLinkedListNode {
    var left:SingleLinkedListNode?
    var nodeValue:String
    /*
     mistake is assuming if we declare the following variable weak to avoid cyclic reference counting
     weak var right: Node? then right node is release as soon we use other function call on the same
     class object
    */
    var right:SingleLinkedListNode?
    
    // constructor
    init(value:String) {
        self.nodeValue = value
    }
    
    // isEmpty
    public func isEmpty() -> Bool {
        if left == nil {
            return true
        }
        return false
    }
    
    // first node
     func first() -> SingleLinkedListNode? {
        return left
    }
    
    // last node
     func last() -> SingleLinkedListNode? {
        return right
    }
    
    // add Node
    func addNode(value:String) {
        let node: SingleLinkedListNode = SingleLinkedListNode.init(value: value)
        if let lastNode = right {
            lastNode.right = node
        } else {
            left = node
        }
        right = node
    }
    
    // find the node in the list for the given string
    func getNodeFor(value:String) -> SingleLinkedListNode? {
        var headNode = first()
        while headNode != nil {
            if headNode?.nodeValue.compare(value) == .orderedSame {
                return headNode
            }
            headNode = headNode?.right
        }
        print("Item \(value) node is not found.!!")
        return nil
    }
    
    // remove Node
    func removeValue(targetNode: String) -> Bool {
        if let foundNode = self.getNodeFor(value: targetNode) {
            var node = first()
            var prev = first()
            var count = 0
            while node != nil {
                if node?.nodeValue == foundNode.nodeValue {
                    if count == 0 { // handle first node
                        left = node?.right
                        node = nil
                        return true
                    } else {
                        prev?.right = node?.right
                        node = nil
                        return true
                    }
                }
                prev = node
                node = node?.right
                count += 1
            }
        }
        return false
    }
}

extension SingleLinkedListNode : CustomStringConvertible {
    var description: String {
        var text = "["
        var node = first()
        while node != nil {
            text += "\(String(describing: node?.nodeValue))"
            node = node?.right
            if (node != nil) {
                text += ", "
            }
        }
        text += "]"
        return text
    }
}



