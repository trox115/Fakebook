# Final Project Checklist

- [x] Use Postgresql for your database from the beginning (not sqlite3), that way your deployment to Heroku will go much more smoothly. See the Heroku Docs for setup info.
- [x] Users must sign in to see anything except the sign in page.
- [x] User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
- [ ] Users can send Friend Requests to other Users.
- [ ] A User must accept the Friend Request to become friends.
- [ ] The Friend Request shows up in the notifications section of a User’s navbar.
- [x] Users can create Posts (text only to start).
- [x] Users can Like Posts.
- [x] Users can Comment on Posts.
- [x] Posts should always display with the post content, author, comments and likes.
- [ ] Treat the Posts Index page like the real Facebook’s “Timeline” feature – show all the recent posts from the current user and users she is friends with.
- [ ] Users can create a Profile with a Photo (just start by using the Gravatar image like you did in the Rails Tutorial).
- [ ] The User Show page contains their Profile information, photo, and Posts.
- [ ] The Users Index page lists all users and buttons for sending Friend Requests to those who are not already friends or who don’t already have a pending request.
- [ ] Sign in should use Omniauth to allow a user to sign in with their real Facebook account. See the RailsCast on FB authentication with Devise for a step-by-step look at how it works.
- [ ] Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.
- [ ] Deploy your App to Heroku.
- [ ] Set up the SendGrid add-on and start sending real emails. It’s free for low usage tiers.

## Extra Credit

- [ ] Make posts also allow images (either just via a URL or, more complicated, by uploading one).
- [ ] Use the Active Storage to allow users to upload a photo to their profile.
- [ ] Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
- [ ] Style it up nicely! We’ll dive into HTML/CSS in the next course.
