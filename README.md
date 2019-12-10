## Footy Lineups Backend

This React/Rails social media app is used to discuss Premier League soccer lineups created by users.  It pulls data from an external API (apifootball.com) to gather the current teams and lineups of English Premier League Teams.  Then users can create ideal lineups that they would like to see utilized by their favorite teams.  

Users are also able to follow other users or be followed by users (think of Twitter).  Once you have followed somebody, you can like or comment on their lineups.  Feel free to be nice!

### Developing locally

THE PASSWORD IS NOT STORED IN PLAIN TEXT - The passwords are salted. They are stored in localStorage so that you do not have to keep logging in continually.

This project uses Ruby on Rails to start the databases and JavaScript with React to render on-screen changes.  The Database = Postgresql.  To Get the database running

Run this command:
```bash
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

Then you should be good to start operating on the backend.  Note that the seed file create a few users and a few lineups.  But you are best off creating your own lineups before you do anything else.

#### BUGS

**If you find a problem with the software**

Please create an email describing the steps to reproduce the software
problem and email it to john.osborne.odom@gmail.com.


## Contributors

* John Odom

Additional thanks to the Flation School Atlanta Team for their outstanding work helping me with this project.

I welcome other contributions - just open up an issue or a pull request.
