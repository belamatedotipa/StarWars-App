# Star Wars App
> This App is made for Lucasfilm to offer a solution to display neatly the information about some of the most remarkable characters of the Star Wars saga.

![roundedicon](https://user-images.githubusercontent.com/35433040/40613522-20fa4d80-627f-11e8-93d0-364cd5ad2556.png)

[![Swift Version][swift-image]][swift-url]
[![CocoaPods Compatible](https://img.shields.io/badge/CocoaPods-compatible-green.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

## Features

### [x] Fetching Star Wars character data from swapi:
The API call for the characters is handled by the DataService class. The results are parsed through a struct that comforms the Codable protocol. In the view controller the the dto is wrapped in a new object that has an additional property (favorite). 

#### How I was thinking:
In the past I have worked with singletons and stored variables in them. I have been reading about drawback of this use case and it was suggested to pass object in a completion handler to achieve stateless services.

#### What could be improved:
The current implemantation handles the paginated API by nested calls to make sure all the characters are loaded. This has been done in order implement the search feature. Ideally just enough characters would load for the tableview to cover the screen. Given that the API only has 87 items, this does not cause a significant performance issue. This method should be reduced to a shorter method, eliminating the log do block or perhaps separated into two functions for better readability and error handling.

### [x] Displaying displaying Characters in tableview: 
I have implemented a segmented control to sort the list by name or birth year (or filter for favorites)
![img_4286](https://user-images.githubusercontent.com/35433040/40613908-ce002c38-6280-11e8-9873-e1a480793dcd.PNG)
![img_4291](https://user-images.githubusercontent.com/35433040/40613913-ce6f976c-6280-11e8-897d-8b5cff5129bc.PNG)

#### What could be improved:
Adding persistent data eg. CoraData with particular sorting keys. This would make the  sorting more efficient. It would also allow a better user experience: given the size and the nature of the data, it could be easily saved locally, eliminating the need for network access. The sorted data could also be cached into a dictionary of arrays, insted of implementing the sort upon user action. The better solution also depends on the use case. 

### [x] Favorite button:
The button in each cell marks characters as favorite. It changes image upon user action.

![img_4287](https://user-images.githubusercontent.com/35433040/40613910-ce34d708-6280-11e8-8012-fcd7597e48d2.PNG)

#### How I was thinking: 
I have implemented the favorite button before the segmented control, making the favorite button work with the data sorted in different order was challenging. 

### [x] Detail View:
If you press the cell the detail of the character (homeworld, films, vehicles) are presented in a new view with a multi segment tableview.

![img_4294](https://user-images.githubusercontent.com/35433040/40620674-f3efe0e6-6299-11e8-8ba6-5839ed509f5c.PNG)

#### How I was thinking: 
I thought a nice way to present the 3 kinds of data is to use a tableview with multiple sections and appropriate headers.  

#### What could be improved:
The network calls are made for the respective tableView cells, this creates a slight lagtime in presenting the data. At first I wanted to make the calls earlier and  and separate from the tableview, now I see how waiting for all the calls could be made easier, yet it would require rearranging the response data for the tableview.

## Extra Features
### [x] Search:
The search feature is implemented to return characters where the search text is included in the name or the homeland of the character.

![img_4290](https://user-images.githubusercontent.com/35433040/40613907-cdcc5606-6280-11e8-95b6-41787fe71d5d.PNG)
#### How it could be improved:
The implementation could have been made more complex with an additional segmented control to set search target. The drawback of the current implementation is that planets are returned in the DetailVC therefore search for homeland is only possible through id. A better way to handle this would be to implement the wrapping of the dto with a protocol and set both the favorite property and the the homeland there.

### [x] Filter for favorites:
The third segment returns a filtered list of the favorite characters

![img_4288](https://user-images.githubusercontent.com/35433040/40613909-ce193746-6280-11e8-8ce5-12878be9b2d2.PNG)

## Meta
Created by:
Bela Mate Barandi – mate_barandi@icloud.com


[https://github.com/belamatedotipa](https://github.com/belamatedotipa)

[swift-image]:https://img.shields.io/badge/swift-4.1-green.svg
[swift-url]: https://swift.org/
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
