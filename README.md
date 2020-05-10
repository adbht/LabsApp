# LabsApp
iOS Dev Coding Challenge Application


## About
An application to display a list of labs. Each lab contains a `lab name`, `lab date`, and a `lab location`. Users can authenticate via email to access their labs and choose to create, read, update or delete their labs. Additionally, a user may tap on any lab to display a google maps view of where the map is located based on the given location of the lab. 


## Screenshots
<img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/logIn.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/register.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/home.png" width="265"/> 


<img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/addLab.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/editLab.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/map.png" width="265"/> 


## Video Demo

https://github.com/adbht/LabsApp/tree/master/Labs/Video%20Demo


## CocoaPods
This application was developed with the help of following CocoaPods: 
   - Firebase
   - GoogleMaps
   - SwiftyJSON
   - ProgressHUD
   
   
## MVC Design Pattern
   - Model
     - [Message.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Model/Lab.swift)
   - View
     - [Main.storyboard](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/View/Base.lproj/Main.storyboard)
     - [LaunchScreen.storyboard](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/View/Base.lproj/LaunchScreen.storyboard)
   - Controller
     - [LogInViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/LogInViewController.swift)
     - [RegisterViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/RegisterViewController.swift)
     - [HomeViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/HomeViewController.swift)
     - [EditLabViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/EditLabViewController.swift)
     - [AddLabViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/AddLabViewController.swift)
     - [LabViewController.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Controller/LabViewController.swift)
