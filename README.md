# BudCodingTest

iOS Swift Coding test for Bud

# Project set up

This project was built using Xcode 10 on MacOS 10.14

This project uses cocoapods to install Alamofire. The pods folder is not included in the project
Please go to the project root folder in Terminal and run "pod install"

Tested using iPhone 5S 12.0 simulator

![alt text](https://github.com/martinogg/BudCodingTest/blob/master/20181019-2.gif "Logo Title Text 1")
![alt text](https://github.com/martinogg/BudCodingTest/blob/master/20181019-3.gif "Logo Title Text 2")

# General Programming description

The main View Controller is created from the Storyboard on startup.

This app an (almost) VIPER structure using a router class to build up the supporting classes.

SOLID principles are observed as much as possible

Unit tests are present (mostly!)

Alamofire is used to load the JSON data from the endpoint and translate in to swift objects, and also to download and cache images.
