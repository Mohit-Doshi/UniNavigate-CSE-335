# UniNavigate-CSE-335

My Fall 2018 Principles of Mobile Application Development (CSE 335) course had a project component which required me to program an iOS Application in Swift. 

I came up with UniNavigate. UniNavigate displays the buildings, floors, and classrooms on ASU's Tempe campus. A user clicks on a building to access all the floors in that building, and clicks on a floor to access all the classrooms on that floor. When a user clicks on a building, a Map View is seen on the screen displaying the location of the building as well as the user's. A user can choose to see the route from their location to the building. Clicking on a classroom opens up a detailed page for that classrom which the user can customize with a course name, notes, and images. All of this information is stored in Core data and cannot be accessed by anyone but the user. The Landing page of the app also displays a list of courses being tracked. 

I wasn't able to find any reliable APIs or data online which would allow me to populate the buildings, floors, and classrooms table views in my app. So I decided to make my own API which I programmed using node.js and hosted on Amazon's AWS Lambda due to its serverless features. Calling this API: https://on6ilrhjvh.execute-api.us-east-1.amazonaws.com/test1 loaded all the information in my app at once. 

I also demoed this app in one of its older versions at sunhacks, held at ASU Tempe from November 9-11, 2018. 

The video for the technical presentation of this project as well as a demonstration of the application: https://youtu.be/DmBeYYh6HU0


