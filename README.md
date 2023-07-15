# Product-Viewer

<p align="center">
  <img src="https://cdn2.iconfinder.com/data/icons/virus-coronavirus-1/64/virus_sanitizer_personal_care_products-1024.png" alt="Products Viewr logo" width="30%">
</p>

  Product Viewer is an app that provide the user with the products provided by the API where the user can see details about every single product where you can see MVVM and RxSwift implemented perfectly.

## Installation

To install and run User Product Viewer locally, follow these steps:

1. Clone the repository:
```bash
git clone https://github.com/Mohamed-Mostafa7/Product-Viewer.git
```
2. Open the project:
```bash
cd Product-Viewer
```
3. install required packages:
```bash
swift package update
```
4. Open the project in Xcode.
5. Build and run the project.

## Features

- Online mode: Once the user open the app it will start getting the data from the server.
- asynchronous image downloading: The products image will be downloaded one by one and presented to the user so thet the UI do not freez while downloading all the available pictures.
- Offline mode: The user can still see the previously loaded results that are stored locally using Core Data if he is not connected to the internet.

## Screenshots
<p align="Center">
  <img src="https://github.com/Mohamed-Mostafa7/Product-Viewer/assets/55007694/96aa0b1b-4233-4b38-b2c0-d0dc8fd88387" width="25%">
  <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/55007694/252982081-8f66d2f5-b32f-4828-b1c7-6af54bd2a309.png" width="25%"> 
</p>

## Technologies Used

The following technologies were used in the development of Product Viewer:
- RxSwift
- MVVM
- Core Data
- SPM
- Coordinator design pattern
- URL session
- Json parsing

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.
