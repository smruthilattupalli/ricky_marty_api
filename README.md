# README

This application is a ruby on rails project which will work
with Rick and Morty API

https://rickandmortyapi.com/api/character

# FEATURES IMPLEMENTED

Models ::
---------
  1. Character (name, status, image)
  2. Episode (number, character)

Rake Task ::
------------
  1. import:characters

Uses RestClient and JSON to fetch data from the External API to
get all the characters

Uses ActiveRecord:Import feature for bulk import

Cron Job ::
-----------
Uses the 'whenever' gem to schedule the import rake task to run every 12 hours

>cronjob -l     --> to list the cron job

Rails.cache.fetch ::
--------------------
Uses caching of the DB data for quick rendering. Used Redis server for cache memory

Pagination ::
-------------
Uses the 'will-paginate_bootstrap' gem to display the results in the view for
navigating different pages

# STEPS TO RUN

1. Clone the repository
2. rails db:create
3. rails db:migrate
4. bundle install
5. rake import:characters (for the first time)
6. rails s
7. http://localhost:3000

