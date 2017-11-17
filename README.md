# README

## Installation

You can install this program in its current form by cloning it by entering ```git clone git@github.com:jmstrick93/clunkr.git``` into the console.

## Usage

1. After cloning the repo, navigate to the repo directory and run ```bundle install```.

2. Then, run ```rails server``` in your terminal.

3. Open your preferred browser and navigate to localhost:3000/, or whatever address at which rails indicates the app is running (you can find this in the rails terminal window-- e.g. ```Listening on tcp://0.0.0.0:3000```

4. Run ```rake db:migrate``` in the terminal.  (You may also use the preexisting seed data by running ```rake db:seed``` next.)

5. Browse the app like any other website.  The website is viewable without logging in, but you will need to create an account to add data to the dynamic site.  This can be done by navigating to "Sign Up" and either creating an account the normal way or signing in through your Google account (recommended).

## Development

After forking and cloning the repo, run ```bundle install```. Then, run rake db:migrate RAILS_ENV. You can also run ```rails console``` in the terminal to experiment with the database and its models.

You may create new migration files by using standard rails generators such as ```rails g migration```.  You can look at existing rails routes by running ```rake routes```.  You can also see a complete list of Rake commands by executing rake -T in the terminal.  

To access admin functions, create a user using the console, specifying ```admin: true``` among the attributes.  Then "log in" with that user.  This will give you the ability to delete cars, brands, users, and resources.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmstrick93/clunkr.

Contributions adding additional functionality are encouraged.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
