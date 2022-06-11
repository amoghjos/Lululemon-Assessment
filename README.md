# Lululemon-Assessment
This is the take home project from Lululemon for the role of iOS Software Engineer. The project has been completed :)

## Challenge

![Designs](https://i.ibb.co/s6kMPfs/Screenshot-2022-06-10-at-9-40-12-PM.png)

### Build two screens as shown above.

- The first screen shows a list of garment names and buttons to order the list by alphabetical order or by creation date/time.
- A “+” button at the top right corner presents the second screen as a modal view.
- The second screen allows saving a new garment in persistent memory, using the database of your choice. Tapping the “Save” button closes the modal view and returns to the first screen with the list. The list then shows the newly added garment.

### unit test some of the code

## Assumptions

Ideally, I would clarify these requirements with Product Owner but I made these assumptions while implementing the project

- We allow duplicate garment names
- Uppercase and lowercase does not impact alphabetical order of garments
- We can't tap on existing garments to edit or delete garment

## Artitecture

![MVC](https://i.ibb.co/dm7MyKf/Screenshot-2022-06-10-at-10-46-51-PM.png)

I'm using MVC design pattern and please check the above image to understand how different units of the code are interacting. I used various techniques such as dependancy injection, logic controllers, model controllers, and many others to ensure that different units of the codebase are loosely coupled and have an overall modular design.

The above artitecture does not cover small units like GarmentsListOrder and StorageProtocol but it should give a good idea. You can check the draw.io diagram at https://drive.google.com/file/d/1Wc6uqTfI_9wK1pkGfYhASp-ULXBRbJhb/view?usp=sharing

## Demo

Here is a screen recording of the app: 

## Testing

I followed Test Driven Development while making this project. Please check Lululemon AssessmentTests folder to find the unit test cases I have written. I followed Arange, Act, Assert pattern for writing test cases. 

## Improvements

- I have left various comments noting some of the techincal debt in the project. Please check the individual comments for more information. 
