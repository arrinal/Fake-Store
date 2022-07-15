
# What’s “Fake Store”?
Fake Store is an App that contain one view only. This app displaying list of product that retrieved data from https://fakestoreapi.com/products. This app built using UIKit framework and VIPER as design pattern, also SPM for the third-party library manager.

# Why VIPER?
VIPER used in this project to easily the testability on the app and if this project continue to become huge project, then this design pattern will more than fit.

# What Devices are Supported?
* iPhone with iOS 13 or higher.

# What Features are Supported?
* Dynamic card view size (also support in landscape mode).
* Infinite scroll, will only fetch new data (product card view) when scrolled down to reduce app workload.

# Requirements to Build the App
* Xcode 13.
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) (already included in the project).

# Instruction to Build
This repo contains all the entire app project requirement, so you can just build and run the project.\
To get things running:
1. Grab the code:
    ```sh
    git clone https://github.com/arrinal/Fake-Store
    cd Fake-Store
    ```
2. Open the Xcode project `Fake Store.xcodeproj`.
3. To run the app locally, select the `Fake Store` target in Xcode and run (`⌘R`).
