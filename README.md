# iTunesCatalog

Sample project that uses the iTunes catalog information to feed a simple list app.

It fetches the information from the following endpoints:
- https://rss.itunes.apple.com/api/v1/ie/movies/top-movies/all/50/explicit.json
- https://rss.itunes.apple.com/api/v1/ie/itunes-music/hot-tracks/all/50/explicit.json

The project consists of two targets, one for the Universal app, and another for Unit tests. Both were developed using Swift 4.1 on Xcode 9.4.

## Current state

Broadly speaking, the architecture of the app consists of three layers:
- Api
- View Controllers
- Coordinators

### API
The Api layer is implemented using Protocols as much as possible, and defines the following concepts:
- Business models
- Resource
- ResourceLoader
- ClientApi

#### Business models
A common List model is declared for the response of each endpoint, using a generic type for the elements of the list.

#### Resource
Typically describes a remote endpoint, by declaring its address, method of fetching and how to parse the data it returns.

#### ResourceLoader
Protocol that defines how to fetch data from Resources.

#### ClientApi
Class that provides methods to fetch business models from the endpoints mentioned earlier.

#### GenericCache
A reference should be made to a simple Caching system implemented in order to avoid downloading multiple times the same image. The cache stores each file on the Library/Caches folder, leaving the responsibility of managing the contents of that folder to the system.

### VIEW CONTROLLERS
In order to help making each UI element more reusable, a Plugin approach was followed to implement the view controllers. So, taking for example the FeedDetailViewController, the class itself almost has no UI code, it is just a container view controller that shows or hides three plugin view controllers:

- LoadingViewController while the API response isn't available yet
- ItemCollectionViewController shows a collection of items for a selected feed
- ErrorViewController in case of an error while fetching the API response

With this solution, each main view controller act as a container, having very little responsibilities other than orchestrating the hiding or presenting of smaller view controllers.

### VIEW MODELS
The more complex view controllers have their own associated ViewModels, responsible for getting and preparing the data needed to present according to its usage. These view models where developed in a way that it is possible to reuse them on a Mac app, for instance as they have no dependency on Cocoa Touch frameworks. When needed, specific extensions were created to add support for the specific needs of running the app on a iPhone / iPad device, for instance adding a method that returns a `UIImage`.

### COORDINATORS
Coordinators are used to remove the logic of navigating between screens from the view controllers, making them more simple and thus adhering to the Simple Responsibility principle. They act as delegates for the view controllers, acting on their behalf when an action may have the output of presenting a different view controller. They also are responsible for creating and maintaining a reference to the dependencies needed for each view controller.

#### AppCoordinator
This coordinator helps laying the foundation of the app, by being the responsible for setting up the main SplitViewController and knowing how to present the view controllers based on the app being executed on an iPhone or an iPad.

#### ListCoordinator
Coordinates the transitions between the main list of feeds and the final controller, responsible for showing the detail of a specific item from a feed.

## What's next

Several improvements could be added to the project. First of all, even though almost every class was implemented with unit testing in mind, the coverage of unit tests could be vastly improved.

Another area that could be improved is the offline usability of the app, by using a local database that could store the API responses and could use that information as source in case of the network not being available.

No special attention was devoted to the scrolling performance of the feed item collection. Also, because we are downloading the images asynchronously, it may happen that when the image is received, the cell where it should be presented is already being reused for another item. This could be easily improved, a simple solution could be cancelling the image request when a cell is about to be reused.
