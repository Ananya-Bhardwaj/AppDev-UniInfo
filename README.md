# AppDev-UniInfo

## Demo

https://github.com/Ananya-Bhardwaj/AppDev-UnivInfo/assets/97379193/dacb263b-7f34-471d-9058-5a708ee948ae

## How it Works?
* The entered country name is saved in a static variable so that it can be accessed on the next page
* A get request is used to fetch data from the API link: http://universities.hipolabs.com/search?country=
* The country entered by the user is sent as a value for the country parameter to the API
* The fetched data is displayed with the help of the ListView widget in Flutter 
* The IconButton widget redirects the user to the website of the University using the onPressed property and a async await function 

## Features
* Easy user-interface
* Returns a list of universities located in the country entered by the user
* Gives the name, location and country of each university
* Redirects the user to the website of the University on clicking the arrow
