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
https://github.com/adbht/LabsApp/blob/master/Labs/Video%20Demo/Aditya_Bhatia_Ios_Developer_Video.mp4
   
   
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
   
     
## Coding Process
I started off by drawing some wireframes of what my application will look like and to get a better idea on how many screens will be needed to build this application. Since this application is for displaying a list of labs, I started off by building the Model for this project [Lab.swift](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/Model/Lab.swift). This struct contains name, date and location which are the required details needed to be stored for every lab. After finishing the Model, I started installing the packages I needed to build this application such as `Firebase`, `GoogleMaps`, and some other UI related pods. This invlovled making new View Controllers for the different pages based on my wireframes. Once that was done, I started working on the Controllers. While I was building new View Controllers, I was also updating [Main.storyboard](https://github.com/adbht/LabsApp/blob/master/Labs/Labs/View/Base.lproj/Main.storyboard). Initially, I was primarily working on the functionality aspect to see if the application works as expected. Since I had integrated the Firebase pod, I started off by adding authentication feature and wrapped up the screens for logging in and registering new users. But since I had other important features to work on, I left the UI design work for later on. I had never worked with Google Maps SDK before so I created a basic application with the necessary `UIKit` components to get me started in checking if I was using the Google Maps SDK correctly. Once I had learnt from the documentations and figured out how to work with that, I added other features to the application such as allowing the users to create, read, update and delete labs from the list of labs being displayed on the application. This aspect was fairly straightforward since I have a decent experience working with `UITableView`s. After finishing the CRUD functionality of the application, I started testing the application with all sorts of inputs from authentication to creating / editing labs. This allowed me to catch and fix some bugs. For example, previosuly my application was accepting empty fields for name, date, and location when creating new labs. So, I made use of `guard-lets` to ensure the user inputs for adding / editing labs or providing user credentials were all valid. Finally, after that, I spent time on cleaning up the UI and and adding constraints to place all buttons and textfields as desired. After that, I added `UIDatePickerView` in order to make sure that the date fields can only take in dates as inputs and no other forms of text. 
