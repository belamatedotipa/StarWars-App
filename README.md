# Star Wars App
> This App is made for Lucasfilm to offer a solution to display neatly the information about some of the most remarkable characters of the Star Wars saga.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/badge/CocoaPods-compatible-green.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)


![](header.png)

## Features

- [x] Fetching data from swapi:
The API call is handled by

- [x] Displaying displaying Characters in tableview
[![Name][sortedByName]]
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

[sortedByName]:(https://user-images.githubusercontent.com/35433040/40612235-f85e01b4-6279-11e8-97cd-ad041b54f5f7.PNG)
[sortedByBirth]:(https://user-images.githubusercontent.com/35433040/40612229-f7e4682c-6279-11e8-83fe-5a61d89d5c97.PNG)
[searchScreen]:(https://user-images.githubusercontent.com/35433040/40612231-f800587a-6279-11e8-9861-a5c0dff2cae8.PNG)
[detailView]:(https://user-images.githubusercontent.com/35433040/40612232-f8174c9c-6279-11e8-87b3-9d165ad893ca.PNG)
[favoriteButton]:(https://user-images.githubusercontent.com/35433040/40612233-f830f124-6279-11e8-8325-2260f560b3b7.PNG)
[favoriteList]:(https://user-images.githubusercontent.com/35433040/40612234-f8469e16-6279-11e8-9dc0-e1d3c58c7d92.PNG)


[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-4.1-green.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE

[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
