# iTunesCatalog
Sample project that uses the iTunes catalog information to feed a simple list app.

It fetches the information from the following endpoints:
- https://rss.itunes.apple.com/api/v1/ie/movies/top-movies/all/50/explicit.json
- https://rss.itunes.apple.com/api/v1/ie/itunes-music/hot-tracks/all/50/explicit.json

The project consists of two targets, one for the Universal app, and another for Unit tests. Both were developed using Swift 4.1 on Xcode 9.4.

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

### VIEW CONTROLLERS
_(tbd)_

### COORDINATORS
_(tbd)_
