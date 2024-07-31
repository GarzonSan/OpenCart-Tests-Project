# OpenCart eCommerce Demo Web Application
The OpenCart eCommerce App is a demo eCommerce application by TheTestingAcademy designed to be used as a practice platform that contains a functional web store page with multiple common features to be explored and tested.

## Documentation
The following documentation was developed for this project:
* Test Plan
* Test Strategy
* Test Cases

## Objective
I've chosen this application to increase the chalenges I'll have to overcome during the tests development since it contains different modules with data that must be carried between them, as well as different features that uses this data for different objectives, that are focused on the user experience inside the demo platform.

## Focus
The following modules of the application will be covered in this test:
* Store Page
* Registration / Login Page
* Shopping Cart
* Checkout Page

### Tools
I've used the **Robot Framework** with the **Python** language, and the **Selenium Library** for this project. The test were ran from a **Jenkins** server running locally, calling the execution on the **Pabot Library** to run the tests in parallel in three different browsers.

### Approach
This platform will be tested to ensure that the entire E2E purchase scenario is working as intended, as well as guarantee that the modules that complement the user experience within the application are working well together.
It will be using automated black-box tests to simulate the user's interaction with the platform.

## Good Practices
I'm still using the **Page Object Oriented Pattern** to keep the project in the most organized and easy to maintain wait, since this time I'm working with an demo application that have more integrated systems, and keeping things separated this way helps when adapting the tests for new features or design changes in applications like this one.

## Final Considerations
With this project I aiming to being able to explore deeply my knowledge about important QA concepts, while working with a much more complex demo application with E2E scenarios.
If you have any tips or ideas, please feel free to open an issue or a pull request, I'd really appreciate that!