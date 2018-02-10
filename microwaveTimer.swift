//
//  microwaveTimer.swift
//  This program calculates the amount of time food should be in the microwave
//      based of the type of food and the amount.
//
//  Created by Matthew Lourenco on 08/02/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

import Foundation

var foodItem: String?
var food: [String] = ["sub", "pizza", "soup"]
var foodTimeInMicrowave: [String:Double] = ["sub":1.0, "pizza":0.75, "soup":1.75]
var timeInMicrowave: Double = 100000.0

// Get food choice
while true {
	print("Enter the item you want to microwave (sub/pizza/soup): ")
    foodItem = readLine(strippingNewline: true)
	if foodItem! != nil && food.contains(foodItem!) {
		break
	} else {
		print("Please enter a food from the list.")
	}
}

// Get number of items
while true {
	print("Enter the amount of \(foodItem!) you are putting into the microwave (Max 3): ")
    let numberOfItems = readLine(strippingNewline: true)
	if let numberOfItemsI = Int(numberOfItems!), numberOfItemsI != nil {
		if numberOfItemsI < 1 || numberOfItemsI > 3 {
			// Check if items in microwave is between 1 and 3
			print("Please put between 1 and 3 food items in the microwave.")
		} else {
			// Calculate time in the microwave
			timeInMicrowave = foodTimeInMicrowave[foodItem!]! + ((Double(numberOfItemsI) - 1) * foodTimeInMicrowave[foodItem!]! * 0.5)
			break
		}		
	} else {
		print("Please enter a whole number.")
	}
}
var timeInMicrowaveSeconds: Int = Int(ceil(timeInMicrowave * 60))
print("Put your food in the microwave for \(timeInMicrowaveSeconds) seconds.")