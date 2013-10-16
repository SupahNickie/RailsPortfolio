Nicholas Case's Portfolio
Code Fellows

[![Build Status](https://travis-ci.org/SupahNickie/RailsPortfolio.png?branch=master)](https://travis-ci.org/SupahNickie/RailsPortfolio)

October 8, 2013

- Began work on the Portfolio assignment, which included setting up a "home" controller, editing titles, basic routing, and creating tests to show my routing worked while running the Rails server on localhost:3000.

![Screencap](/public/images/screenshot.png "Screencap of Test Passing")

October 10, 2013

- Currently, there are six tests passing, a "can access home" smoke test, a "check for bootstrap" test to make sure the site is using the Bootstrap framework, and four tests covering the CRUD capabilities of the "Post" controller (handling blog posts). All tests are green and automated on Travis to check for any new Git commits. Site also currently has a Bootstrap template that is more proof-of-ability than anything else, as the site may look quite a bit different when it is finally deployed publicly. Enclosed is a screenshot of the site as it appears on a development environment as of the end of October 10th.

ERRORS: Deployment to Heroku is problematic at best since my installation does not seem to want to be able to change from SQLite3 to Postgres, which Heroku requires. Furthermore, despite trying to edit the CSS of Bootstrap by myself and also alternatively with a vendor's style theme, the behavior of it with Rails is erratic. Specifically despite the home.scss.css file

ERROR (solved on October 11, 2013): Thanks to Thanh, I was able to install the Postgres gem (my Ruby installation was missing a key component and he found a relevant thread on Stack Overflow). Work will still continue on solving the CSS integration errors.

![Screencap](/public/images/screenshot2.png "Screencap of basic Bootstrap site")

October 11, 2013

- App is now live at Heroku. URL is http://stormy-fortress-1735.herokuapp.com/

- Figuring out CSS issues, though my app still does not seem to want to work fully with the asset pipeline. I will do more investigation into the matter on the weekend.

![Screencap](/public/images/screenshot3.png "Screencap of Bootstrap Blog page with new CSS theme")

October 14, 2013

- Finished writing tests for CRUD actions in the Projects section. Renamed Heroku app to http://case-railsportfolio.herokuapp.com

October 15, 2013

- Implemented user authentication (minus admin authorization and permissions) into the app, but my tests are not passing due to a conflict between the fixtures and my database. I'll be seeking help regarding this next class meeting.

Update: I removed the references to the fixtures in the tests because they don't work with my database, hardcoding the data with representative data and now my tests pass while still representing the correct actions on my app.
