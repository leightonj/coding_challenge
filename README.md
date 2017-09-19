# Coding challenge README

* Ruby 2.3.3

* ENV['OMDBAPI_KEY'] must be set to use omdbapi

* rake db:create to create your database

* rake db:seed to insert an initial user

* rspec to run all tests

* all API requests must include username & usertoken

This is a vanilla Rails 5 App install, created with the command:

`rails new coding_challenge --api --skip-active-record`

There is a HomeController that should demonstrate it works by going to the root of the app in your browser or with curl.

Your customer wants you to create an API that lets you search for movies by word and year, and the results brought back should be a breakdown of the most common other words in movie titles for all the movies matching the search for that year, with a count of each occurrence.

For example, if I search for the word 'star' in the year 2000, it might be that 'all' appears 13 times, 'lone', appears 5 times, etc.

You have access to the OMDB API for this http://www.omdbapi.com/

Your api key is `e260c91c`

Your task is to create a pull request (or multiple pull requests if you prefer) to meet the following requirements

- Create an API endpoint where you can submit a search and get the results as described above in some sensible JSON format.
- Add some sort of authentication, so if it was on the open Internet, it would not be freely available to anyone who found it (no need for user accounts, just some simple protection to stop a random person having access)
- Bonus points - write some pertinent tests.

Please write the code as if it intended to be used in a production system - i.e. it should be secure and well-designed.
Do worry about performance a bit - it shouldn't make unnecessary requests or more processing than it needs to.
Don't worry about scalability for the moment (i.e. it doesn't need to scale to 100s of users.)
You will be judged on your ability to deliver working code that meets the requirements and code structure and design.
Feel free to add any Gems you like to the project to meet the requirments.

Ideally this will take you no more than 2-3 hours. Please open a pull request(s) when you are finished.

If the requirements are not clear, or you require any clarification, please email dan@reasonactory.com
