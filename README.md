# Search Bar App

## Overview
The Search Bar App is a Flutter-based mobile application that allows users to search for products through a sleek and intuitive interface. This project demonstrates the power and flexibility of Flutter for building beautiful and responsive applications.

## Features
- **Modern UI**: A clean and responsive user interface designed with user experience in mind.
- **Search Functionality**: Efficient search capabilities that allow users to quickly find the products they are looking for.
- **API Integration**: Seamless integration with a product API using Dio for HTTP requests.

## Screenshots
<img src="https://github.com/Sourav0174/searchbar_app/assets/146104055/2f9163f1-d832-448d-9e60-63427600e97a" width="300">
<img src="https://github.com/Sourav0174/searchbar_app/assets/146104055/5a6b2937-8e5c-4ec2-9dfc-a99d80020c0d" width="300">




## Technologies Used
- **Flutter**: For building the UI and handling user interactions.
- **Dart**: The programming language used for Flutter development.
- **Dio**: For making HTTP requests to fetch product data from the API.

## Getting Started

### Prerequisites
Make sure you have Flutter installed on your machine. You can follow the instructions [here](https://flutter.dev/docs/get-started/install) to install Flutter.

### Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/searchbar_app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd searchbar_app
    ```
3. Install the dependencies:
    ```sh
    flutter pub get
    ```

### Running the App
1. Connect your mobile device or start an emulator.
2. Run the app:
    ```sh
    flutter run
    ```

## Project Structure
```plaintext
lib
├── main.dart               # Entry point of the application
├── models
   └── product.dart        # Model class for Product
   └── home_page.dart      # Home page containing the search bar and product list

