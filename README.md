# MarvelApp

## Description

The application is developed using the [Marvel API](https://developer.marvel.com), in order to explain how to use Clean Architecture and good practices.  Some points to keep in mind:

* The architecture is based on `VIPER`, which is an implementation adapted to iOS of Clean Architecture, complying with the `SOLID` rules. In this [article](https://alfonsomiranda.com/posts/clean-architecture-ios-viper/), I explain the philosophy and rules of this architecture in more detail.
* Each module or "screen" of the project is made up of a ViewController (+ xib), a Presenter, a Router, and an Interactor. This is built from an assembly
* For each layer we have a Base class, together with its protocols, that unify and ensure certain common functionalities and behaviors of each of them.
* In the `BaseProvider` we work with a connection manager, whereby implementing the BaseProviderProtocol we can add the different implementations that we want. In this example Alamofire is being used, with `AlamofireManager`, but it could be changed to the other Manager in the project called `NativeManager`, which does not make use of any external library, and everything would continue to work the same.
* In the project 4 targets are created: `Local`, `development`, `pre-production`, and `production`. Everything is prepared to have those four environments consuming from different environments. In this case, all the targets consume the same, but it is already prepared for when in a real project we have that backend.
* A manager is being used for the tables (`TableViewManager`) that delegates all responsibility to the presenter.
* `Unit Testing` View, Presenter, Interactor and Provider test cases
* `Third party libraries` with **Cocoapods**:
    * `Alamofire` Network layer
    * `KingFisher` Loading & Caching images
    * `JGProgressHUD` Loader view
    * `SwiftLint` Swift style and conventions

## Run Requirements

* Xcode 10+
* iOS 12+

### Build and run the application

1. Install Pods

```bash
pod install
```

2. Added public and private key in 

```
Marvel Target -> Build Settings -> User-defined-> MARVEL_API_KEY
Marvel Target -> Build Settings -> User-defined-> MARVEL_HASH
```

3. Open project

```bash
open Marvel.xcworkspace
```

4. Build, run and enjoy
