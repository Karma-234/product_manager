# product_manager

Product Manager.

## Brief Description

This application allows users to add, delete and update products to a sqlflite datatbase. Users can add the product title, description, cost price, selling price, image and quantity of the product to the database.

## Architecture

The Model - View - ViewModel (MVVM) was used for separation of concerns and adopt clean code practice.

## Dependency Injection

The Getx package was used for dependency injection to with a structured approach for providing values to dependent components.

## State management

The Getx package was used for state management for its reactive state management approach that updates only the necessary parts of UI depending on the changing variables.

## Routing

- GetX has an inbuilt routing system that allows easy routing while abstracting the context.

## External Packages
- The Image picker allows user to upload image of product from camera or gallery.
- Flat_orm was used as object relational model to query the sqflite databse.




