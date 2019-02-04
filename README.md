# Colin Armstrong CampSpot Tech Challenge



## Setting Up and Running the Program

### Prerequisites

You will need access to a terminal application and have Ruby setup on your machine.

### Installation and Setup

This program is written using Ruby version 2.5.3.  If you need to get Ruby set up on your machine, follow the instructions [here](https://www.ruby-lang.org/en/documentation/installation/).

Once you have Ruby installed, run the following command from your terminal to install Bundler, a Ruby dependency manager:

```
$ gem install bundler
```

After installing Bundler, clone this repository to your local machine:

```
$ git clone https://github.com/colinwarmstrong/campspot_tech_challenge.git
```

Next, change into the directory:

```
$ cd campspot_tech_challenge
```

Now install the necessary gems using Bundler:

```
$ bundle install
```

The program and is now setup and ready to run on your machine!

### Running the Program
To run the program, run the following command from the root directory of the repository:
```
$ ruby runner.rb
```
This will run the program and print out the available camping spots based on the JSON payload located in the test-case.json file.

If you would like to run the program using a different .json file, simply add the file to the root directory of the repository and change the filename on line 3 of runner.rb to the name of your new file.

### Running the Test Suite

To run the test suite, simply run:
```
$ rake
```
This will run all the tests and print out the results to the terminal.

## Approach to Solving the Problem

My overall approach to this problem involved using object-oriented principles to break the problem down into a few classes the I felt best modeled the reservation system outlined in the spec.  The overarching class was the reservation system itself which handled bringing in and processing the JSON data.  The reservation system then created individual campsite objects and these campsite objects created reservation objects.  Together, I felt these three classes were able to model the overall system pretty well.

After I had these three classes outlined, I was able to use test-driven development to build out the overall behavior of the program.  I started with being able to bring in and model the data defined within the JSON payload and then worked my way into using that information to determine which campsites were available for reservation.

Overall, I feel taking an object-oriented approach to this problem worked out well.

## Assumptions and Special Considerations

This program runs under the assumption that we are only trying to prevent one-night gaps.  Some refactoring and other considerations would need to be implemented to adapt this program to also handle two- or three-night gaps.  








