Quizzia
========================

Welcome to Quizzia! This is an interactive trivia game whose questions is sourced from a third-party API.



## Description

Quizzia is a Command Line App that receives the user’s input as an answer, check if the answer is correct, and gives the respective response. Quizzia stores the game history and scores of individual users. This application demonstrates the concept of create, read, update, and delete (i.e., CRUD) using the Ruby language.

## Features

1. Statistics Page - Stores the amount of questions answered correctly and the amount of questions. Calculates an average based on these two paramaters.

2. Audio - An audio clip will play if the user correctly answered the question or not

## Installation

1. First fork and clone this repository into your local computer.
2. Navigate to the directory where it was cloned and run the following command: ``bundle install``
3. Next, run this following command: ``rake db:migrate``
4. Now, whenever you want to open the application, run this command: ``ruby bin/run.rb``

## API Reference

https://opentdb.com/

## How To Use

When the application is opened, it will ask for a username. You may type in a username that exists, which will bring in all previous data associated with that username, or create a new username.

Please follow the instructions and options displayed on the screen. 

When deleting a username, the application will automatically exit. This will indicate that the username was successfully deleted. To open the application again, run the following command: ``ruby bin/run.rb``

## Credits

Quizzia is a collaboration project between Paul Riverain and Samuel Guo. Link for their respective github profiles can be found below:

Paul Riverain: https://github.com/paulriverain

Samuel Guo: https://github.com/guosamuel

🎊 Hope you have fun! 🎊
