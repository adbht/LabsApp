# LabsApp
iOS Dev Coding Challenge Application


## Features
   - User authentication with email
   - CRUD functionality
   - Labs contain name, date and location
   - Displays a list of labs
   - Users can click on any lab to open a Google Maps query and see the location of the lab


## Screenshots
<img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/logIn.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/register.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/home.png" width="265"/> 


<img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/addLab.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/editLab.png" width="265"/> <img src="https://github.com/adbht/LabsApp/blob/master/Labs/Screenshots/map.png" width="265"/> 


## Video Demo
[Video Link](https://github.com/adbht/LabsApp/blob/master/Labs/Video%20Demo/Aditya_Bhatia_Ios_Developer_Video.mp4)

   
## MVC Design Pattern
   - Model
     - [Lab.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Model/Lab.swift)
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
     
     
## CocoaPods
This application was developed with the help of following CocoaPods: 
   - Firebase
   - GoogleMaps
   - SwiftyJSON
   - ProgressHUD
