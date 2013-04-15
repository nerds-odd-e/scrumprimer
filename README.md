Scrum Primer
====================
[![Build Status](https://travis-ci.org/basvodde/scrumprimer.png?branch=master)](https://travis-ci.org/basvodde/scrumprimer)

Scrum Primer is a short introduction to Scrum written by Pete Deemer, Gabrielle Benefield, Craig Larman and Bas Vodde. This page contains the code of the http://www.scrumprimer.org website.

The scrumprimer.org website is a simple Sinatra app for making the site easy accessible for an international audience.

Contributions
============

Contributions are welcome!
There are several different areas in which you can contribute:

*Scrum Primer Document*

We'd love contributions to the Scrum Primer document itself. If you want to request a change request for the English version, please open an issue with "document change" tag. If you wish to contribute a translation or to a translation, please either do a pull request or mail @basvodde

*scrumprimer.org site translation*

We'd like to keep the site translated to several languages. The translation uses the r18n ruby gem, which means the extracted language strings are in the i18n yml files. If you want to contribute, just translate the English yml file and either do a pull request or mail @basvodde

*scrumprimer.org site itself

The site itself is very basic and requires still a lot of improvement. You could contribute on functionality or on design just by doing pull requests or ideas by opening an issue.

When contributing, please make sure you have proper testing in place (see below)

Testing Frameworks
============
Also the site is used as an example of test technologies in order to compare them with each other. The current testing (and specification) frameworks used:

* [RSpec](https://github.com/rspec/rspec)
* [Jasmine](http://pivotal.github.io/jasmine/)
* [Mocha](https://github.com/visionmedia/mocha) (TBD)
* [Cucumber](https://github.com/cucumber/cucumber)
* [Robot Framework](http://code.google.com/p/robotframework/)

The specifications in RobotFramework and Cucumber are kept similar so that you can see how the different specification tools compare with each other.

Contributions
============

For the Scrum Primer translation:
* Chinese -> Terry Yin, Sun Yuan
* Bulgarian



