# MotorwayRandomText

## Overview

This app generates random words sourced from input lists into a field where users can manipulate the
text in a number of ways, e.g. copying, adding and deleting. 

Technically speaking, this app has one screen written using SwiftUI. The app demonstrates use of the
MVVM architectural pattern - the view for the screen has an associated view model from which it pulls
ready-to-display data. This data is retrieved from a repository which, for the purposes of this project, 
essentially acts as a simple interface to get a list of words from a JSON file bundled with the app.
See the Discussion section for more information.

The project includes some unit tests for the view model, taking advantage of the way that the view model
has its dependencies provided to it via protocol separation.

## Discussion

### Motivation for file-based solution

The project brief could have been satisfied using a file-based (words loaded from bundled file) or 
network-based (words pulled from API and stored on device) solution - this initial version uses a 
file-based solution. There are a number of justifications for this:

- A file-based solution is much simpler to implement and helps to get the app to a MVP state faster.
  Otherwise, an API would have to be sourced and a full network layer and storage solution would have 
  to be designed and implemented.
- The nature of the data (English words) is not very likely to change or need updating. This reduces
  the need for higher-frequency refreshing via the network. 
- The solution has been written using a repository pattern, which allows the connection of a network
  service in the future with minimal change to the UI layer.

## Other things to note

- The view model allows setting the number of random words to generate through the use of a configuration
  struct. This defaults to 50 words.
- There is an intermediary `Decodable` model used when extracting the data from the provided JSON file.
  This is set up to represent the JSON structure as is directly from the file taken from the Corpora project
  (see below.) The repository does not expose this model.
- For the sake of simplicity, the data layer sources are included in the main app target. Generally, these
  should be put in their own framework or package to explicitly separate them from the UI code.

## Resources

Words JSON sourced from https://github.com/dariusk/corpora/blob/master/data/words/common.json
