# State Data API

This project is to create a web API that returns data about the fifty US states. In particular, the data revolves around the following:

- Median household income (2016)
- Percentage of unemployed population (2016)
- Percentage of population that lives in metro areas (2015)
- Percentage of adults 25 and older with high-school degree (2019)

The API should return this data for each of the US states. In addition, it should also provide the full state name (e.g. `"Florida"`) as well as the state's abbreviation (e.g. `"FL"`).

## The Data

We've provided two CSV files. The `state_data.csv` file contains the primary data, and the `abbreviations.csv` file contains the abbreviations for each state.

If you prefer, you can move the data from the CSV files into a database. However, we'd like to see the script you use to do so. (That is, don't copy and paste the data manually into the database!)

## The API

The API should return results in JSON. You should make the following endpoints available:

- `/states` -> should return an array of _all_ the states with their accompanying data
- `/states/:STATE_ABBREVIATION` (e.g. `states/FL`) -> should return the data just for that state

## Bonus: A Front-End

If you really want to impress us, build an front-end interactive map that displays the data from the API. One possible tool for this is [DataMaps](http://datamaps.github.io/), or you may find another useful libraries in [this article](https://www.hongkiat.com/blog/javascript-libraries-for-interactive-maps/).
