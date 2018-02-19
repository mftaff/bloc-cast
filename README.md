# [BlocCast](https://bloc-cast.herokuapp.com/)

#### A TV Discovery Webapp

##### Doing the finding for you - search for shows, and let us make the connections.
Powered by ['The Movie DB'](https://www.themoviedb.org/) 

# The Problem

This web app proof of concept is a response to the certification challenge at
the end of the [Bloc.io](https://www.bloc.io) Software Developer Course. The
challenge is to build a website that uses The Movie DB's API to allow users to
see a list of popular TV shows, as well as search for them. Upon clicking
on a specific show, a user should see more information about that show. These
features should be wrapped with a full test suite, a comprehensive UI/UX, be
built with a full stack, and finally be deployed to production.

# The Solution

[BlocCast](https://bloc-cast.herokuapp.com/) satisfies the above challenge in a
straightforward, and simple manner. Upon landing on the BlocCast's homepage a
guest will see a list of the most popular TV shows, as well as a list of New TV shows
(all having first aired within the last year.) This same guest can search for TV shows from
any page of the website, as well as click on any TV show to see more details about
that show. At any time a guest can choose to sign up/in. Once a user has signed up,
BlocCast will start saving the users search history. This data will be used to
generate a list of recommended TV shows that will replace the list of New TV shows
seen by a guest. (Note that this last feature is my own addition -
added to provide a greater level of interaction between a user and BlocCast.)

A slightly more technical Description of BlocCast follows:

Nav:
- The Logo: Clicking the logo will link to the home page (index view)
- Search: Allows searching for TV shows
- About: Points to the About page (Which contains links to this README)
- User Controls: Edit Profile, and Sign in/up/out

Website's Pages:
- Index: Displays a list of most popular TV shows, as well as a list of
recommended shows (if the user is signed in) or a list of new shows (if the user is a guest.)
- Search: Displays a list of shows returned from the search query, as well
as the recommended/new show list.
- Show: Display more info about a specific TV show, again the recommended/new show
list is displayed.
- About: Display basic site information as well as links to this README.

Recommended TV show algorithm:
- Guest users will see a list of new TV shows (first aired within past year)
- Signed in users will see a list of TV shows based on their search history (This
works by keeping track of which genres show up in their search results, and building
a list of shows based on the most common genres)
- From the show view (when viewing a single TV show) Guests and Signed in users
will see a shorter list of shows based on the genre of the currently viewed TV show
- In the event that one of these lists returns a bad response, the list will default
to display the most popular shows

# Design Choices

I chose to write BlocCast using Rails, and to deploy using Heroku. The database used
is PostgreSQL, the test suite used is Minitest, and for the frontend I used Bootstrap as the baseline.

My decision for the above choices are as follows: Rails provides a simple, streamlined,
and most importantly - comprehensive system to build a full stack web app, all with
minimal setup and configuration. As I saw time and again while completing the Bloc curriculum,
the use of Rails for webapp building makes the process go from a complex one, to a straightforward one.
By the same reasoning I chose to deploy with Heroku. The level of integration between Rails
and Heroku make the launching process intuitive, as opposed to grueling :-) My database
choice was governed by my decision to use Heroku - hence PostgreSQL. I used Minitest
as I like that it mimics ruby syntax, and my choice of adding Bootstrap for the frontend
was to help with smooth transitioning of screen sizes.

This project has great potential for additional/expanded features.

- The easiest of these would be to add support for other media types in TMDB’s
API, for example movies, and/or personalities.
- While the above feature would expand the scope of what BlocCast offers, to really
bring this app to the next level I would want to add a more robust algorithm for
generating the list of recommended TV shows. Currently, the algorithm stores a
record of how many times each genre has occurred in a user's search queries. It then
uses this data to build a recommended list of shows, based on the most searched genres.
To expand on this, BlocCast could store the cast/creators of a Show, and perhaps
other metadata - like number of seasons, air dates, etc. In aggregate this data
could be used to create a more dynamic representation of a users preferences - thus
providing improved recommendations. (This would be a textbook case for machine learning
to play a significant role.)

