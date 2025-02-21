# Project Explanation

My initial thought process when approaching this project was to start by writing the backend logic for extracting the `content` part of the `og:image` tag (if present) and then wiring up the front-end to provide the URL to that logic.

However, my lack of facility with the front-end got to me and proved to be a significant stumbling block in this project.

If I had been able to complete the front-end component of this project, my plan from there would've been as follows:

* Writing at least a handful of unit tests foe the URL processing logic. Since this is being written in Elixir, the canonical solution for this would be [`ExUnit`](https://hexdocs.pm/ex_unit/ExUnit.html). I would want my tests to not only handle situations where the `og:image` tag is or isn't present, but also situations where the provide URL doesn't exist or returns 300-level or 500-level codes and the like.

* Writing a Makefile to expedite the setup and running of the local project, so that any devs who get this project don't need to rememeber the right `mix` commands for getting up and running

* If the performance of my initial solution wasn't quite up to par, I would explore storing the images in Postgres as a [BLOB](https://www.postgresql.org/docs/7.1/jdbc-lo.html) datatype. While this wouldn't improve the first call to a URL, it would likely speed up subsequent calls. This would also introduce the risk of presenting stale data to the user, should the content change between calls. It's also worth noting that this is a bit of misuse of Postgres and is more suited to the likes of a CDN or something that is more optimized for image-like content.

Some other areas for extension/improvement would be:

* Writing a Docker compose file so that devs who get this project can get it running locally with ease

* Since this project does have a front-end component to it, some testing with the likes of Selenium or the Robot Framework would also be very helpful

* Adding two GitHub Actions to the project. The first would run the unit tests referred to above every time code is pushed to the repo in order to prevent the introduction of regressions. The second would run `mix format` for ensuring consistent formatting of the Elixir files.
