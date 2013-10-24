Nicholas Case's Portfolio

Code Fellows

[![Build Status](https://travis-ci.org/SupahNickie/RailsPortfolio.png?branch=master)](https://travis-ci.org/SupahNickie/RailsPortfolio)

October 8, 2013

- Began work on the Portfolio assignment, which included setting up a "home" controller, editing titles, basic routing, and creating tests to show my routing worked while running the Rails server on localhost:3000.

![Screencap](/public/images/screenshot.png "Screencap of Test Passing")

October 10, 2013

- Currently, there are six tests passing, a "can access home" smoke test, a "check for bootstrap" test to make sure the site is using the Bootstrap framework, and four tests covering the CRUD capabilities of the "Post" controller (handling blog posts). All tests are green and automated on Travis to check for any new Git commits. Site also currently has a Bootstrap template that is more proof-of-ability than anything else, as the site may look quite a bit different when it is finally deployed publicly. Enclosed is a screenshot of the site as it appears on a development environment as of the end of October 10th.

- ERRORS: Deployment to Heroku is problematic at best since my installation does not seem to want to be able to change from SQLite3 to Postgres, which Heroku requires. Furthermore, despite trying to edit the CSS of Bootstrap by myself and also alternatively with a vendor's style theme, the behavior of it with Rails is erratic. Specifically despite the home.scss.css file

- ERROR (solved on October 11, 2013): Thanks to Thanh, I was able to install the Postgres gem (my Ruby installation was missing a key component and he found a relevant thread on Stack Overflow). Work will still continue on solving the CSS integration errors.

![Screencap](/public/images/screenshot2.png "Screencap of basic Bootstrap site")

October 11, 2013

- App is now live at Heroku. URL is http://stormy-fortress-1735.herokuapp.com/

- Figuring out CSS issues, though my app still does not seem to want to work fully with the asset pipeline. I will do more investigation into the matter on the weekend.

![Screencap](/public/images/screenshot3.png "Screencap of Bootstrap Blog page with new CSS theme")

October 14, 2013

- Finished writing tests for CRUD actions in the Projects section. Renamed Heroku app to http://case-railsportfolio.herokuapp.com

October 15, 2013

- Implemented user authentication (minus admin authorization and permissions) into the app, but my tests are not passing due to a conflict between the fixtures and my database. I'll be seeking help regarding this next class meeting.

October 19, 2013

- Implemented user authorization with three distinct roles: editor, author, and visitor. Visitors do not have accounts and are allowed only to view blog posts properly marked as Published. They do not see any other controls. The editor has full admin powers over the website and is in control of post CRUD for all posts, as well as the ability to "Publish" posts. Authors are allowed to CRUD their own posts (and no one else's), but are not allowed to set theirs to the published status. Interestingly, authors are not allowed to see other authors' published articles as well (which follows the prompt).

- First commit of the day: (~10am)

I finished the tests for the "editor" role abilities, including the working Publish button. Later today, I will finish the tests for the "author" and "visitor" roles.

- Last commit of the day: (~1pm)

Wrote the tests to completion for the author and visitor roles. Writing tests is also seeming to work for me on the first try now since the behavior is so intuitive with Rails and the various helpers like Capybara and its DSL.

October 21, 2013

MORNING:

- Redefined the Post Policy file to refine the role of the author to a more realistic standard, allowing them to edit only their posts and not any other authors' as well as to see all published blog posts (just like an unsigned-in user).

- Also fixed the Heroku app's database issues.

AFTERNOON/NIGHT:

- Added Twitter login capabilities as well as working comment section, though I haven't yet programmed the "submission to moderators" feature yet; all comments automatically show up regardless of their "published" status. Also note the visible or invisible URL field depending on whether the user submitted one or not with their comment.

![Screencap](/public/images/screenshot4.png "Screencap of working comment section")

October 22, 2013

- Added polymorphic associations for comments, so now projects and posts can both have their own sets of comments (working off the comments model and controller). Tests written to cover comment posts on projects, and all are passing.

- TODO: Still haven't created an "approved" button for editors/authors to click on submitted comments.

October 23, 2013

- Polished up the association between users and comments, so now the permissions are equivalent between Post and Project (including their comments). The permissions are as follows:

AUTHORS:

-CRUD Posts and Projects, but not publish any. All other authors' published works are visible as well.
-Submit comments for moderation (on other peoples' works)
-Delete/Approve comments on their own works

EDITORS:

-CRUD and Publish Posts and Projects, all works are visible.
-Leave comments, all others' comments are visible.
-Delete/Approve comments on ALL works

VISITORS:

-Read Posts and Projects if they are published
-Read comments if they are published
-Submit comments for moderation
