# Star Wars App
> This App is made for Lucasfilm to offer a solution to display neatly the information about some of the most remarkable characters of the Star Wars saga.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/badge/CocoaPods-compatible-green.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)


One to two paragraph statement about your product and what it does.

![](header.png)

## Features

- [x] Fetching data from swapi:

- [x] Displaying displaying Characters in tableview
- [x] Segmented control to sort list by name or birth year or filter
- [x] Favorite button:
The button in each cell marks characters as favorite. It changes state upon user action to match

## Extra Features
- [x] Search Bar:
The search feature is implemented to return characters where the search text is included in the name or the homeland of the character.

How it could be improved:
The implementation could have been made more complex with an additional segmented control to set search target. The drawback of the current implementation is that planets are returned in the DetailVC therefore search for homeland is only possible through URL.

- [x] Filter for favorites:
The third segmented control of the returns a filtered list of the favorite characters



● Get a list of the characters from http://swapi.co/api/people API.
● Show a list of characters sorted by default on name.
● Add one button that allows the user to change the sort method between:
○ Character name.
○ Character birth year.
● Add one button to each cell to mark characters as favourite.
● If you press the cell you have to show another view with the character detail  information:
○ Films.
○ Vehicles.
○ Homeworld.



## Meta

Bela Mate Barandi – mate_barandi@icloud.com



[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-4.1-green.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE

[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
