# FakeBook 

A simple Facebook web app created using Ruby on Rails.

**Fakebook** is a simple facebook web app, made using the methodology of [The Oding Project](https://www.theodinproject.com). This project ask us to make a fake Facebook app and you can click [here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project) to see the project requirements.

After each milestone the project will be reviewed and approved by a **TSE** from [Microverse](https://microverse.org)

## Tools used

In this project we used:
* Ruby
* Ruby on Rails Framework
* Html
* CSS
* Lucid Chart - For building the ERB wich you can see [here](https://www.lucidchart.com/documents/edit/16a6d1e7-9690-41af-a0f4-4a94eacabbdc/0_0?shared=true)

# Author

This project was created by:

* António Fernandes [Github account https://github.com/trox115](https://github.com/trox115)
* Carlos Del Real [Github Account https://github.com/carloshdelreal](https://github.com/carloshdelreal)


# The Web App

The live version of this project is on [Fakebook by Carlos and António]()

# Required Installations

If you want a copy of this project running on your machine you have to install:

* Ruby 2.6
* gem 3.0
* Bundler 1.17
* Rails 6.0.0

For installation instructions follow [The Instalation Guide](https://www.tutorialspoint.com/ruby-on-rails/rails-installation)


# Instalation of This App

Once you have installed the requiered packages shown on the [Required Installations](https://github.com/trox115/Fakebook#required-installations), proceed with the following steps

Clone the Repository, the folder toy_app will be downloaded

```Shell
your@pc:~$ git clone https://github.com/trox115/Fakebook.git
```

Move to the downloaded folder

```Shell
your@pc:~$ cd Fakebook
```

install gems

```Shell
your@pc:~$ bundle install --without production
```

migrate the database

```Shell
your@pc:~$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:

```
your@pc:~$ rails test
your@pc:~$ rspec
```
If the test suite passes, you'll be ready to run the app in a local server:

```Shell
your@pc:~$ rails server

```

Then, go to [http://localhost:3000/](http://localhost:3000/)

Voila!

# License

All the source code in the [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/forms) is available jointly under the MIT License and the Beerware License.

