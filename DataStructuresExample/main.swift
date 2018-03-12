//
//  main.swift
//  DataStructuresExample
//
//  Created by Shingade on 3/9/18.
//  Copyright © 2018 com.orgname.ds. All rights reserved.
//

import Foundation

print("Hello, World!")

let linkedList:SingleLinkedListNode = SingleLinkedListNode(value: "1")
linkedList.addNode(value: "6")
linkedList.addNode(value: "5")
linkedList.addNode(value: "4")
linkedList.addNode(value: "3")
linkedList.addNode(value: "2")
linkedList.addNode(value: "1")
print(linkedList)
var isRemoved = linkedList.removeValue(targetNode: "6")
isRemoved = linkedList.removeValue(targetNode: "1")
isRemoved = linkedList.removeValue(targetNode: "9")
print(linkedList)
