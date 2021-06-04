# Fishtopia

A small, open-ended fishing game built in Ruby.  Designed as a practice project while learning Ruby (and because you can never have too many fishing games).

## Installation / Running the Game

1. Clone this repository to your local folder
2. Open the terminal and `cd` to the cloned repo location
3. To run the game, use the following command in the terminal: `ruby game_exe.rb`

## Usage / Playing the Game

Once you've finished the steps above, you can play the game in the terminal.  You'll first be asked to choose between "New Game" or "Load Game."  If you type "load" (or a few accepted variations), the currently saved game data will be loaded: this includes any fish / bait you've collected and the current state of the fishing spots.  Otherwise you'll start a new game with no items and a fresh set of fishing locations.

Fishtopia is a keyword-based fishing game with a Battleship-style mechanic.  The keywords you can use when not actively playing the fishing mini-game are:

"**fish**" - begin fishing at your current location
"**move**" - move to a different fishing spot
"**shop**" - exchange fish for bait at the shop
"**save**" - save your current game
"**stop**" - quit the game
"**help**" - receive a list of keywords (a reminder of the words above)

If you input an invalid keyword the game will simply ask the same question again.

Many of the keywords above will lead to additional input requests.  If you choose...

"**move**" you'll be asked where you would like to go.  The current options are "**river**" and "**ocean**".
"**shop**" you'll be asked how much bait you want to buy.  This expect an integer input: if you try to buy more bait than you can afford, the shop will tell you the max amount of bait you can buy.
"**save**" you'll be asked if you want to save and continue or save and quit.  "**continue**" saves but lets you keep playing; "**quit**" saves and exits the program.
"**stop**" asks if you'd like to save before quitting.  "**yes**" (and a few accepted variations) will save while anything else will not; both answers will then exit the program.

"**fish**" will begin the fishing mini-game.  When fishing, you will see a grid with a row of letters at the top and a column of numbers on the left like so:
```
  A B C D
1 ~ ~ ~ ~
2 ~ ~ ~ ~
3 ~ ~ ~ ~
4 ~ ~ ~ ~
```  
To fish in a specific location, type the letter of the column and number of the row you'd like to cast to.  For example, "**A1**" will cast to the upper-left corner of the grid shown above while "**D4**" would cast to the bottom-right corner.

As in Battleship, fish take up more than one square of space: the smallest fish takes up two squares while the largest takes up four.  If you "hit" part of a fish, you'll be told "Hit!" and receive an "**o**" on that square.  If you don't hit any fish, you'll be told "Miss!" and receive an "**x**."  
```
  A B C D
1 ~ ~ x ~
2 ~ ~ ~ ~
3 ~ o ~ ~
4 ~ ~ ~ ~
```
In the grid above, we've tried "C1" which was a "miss."  But "B3" was a "hit!"

If you "hit" all parts of a fish before running out of guesses, you'll catch that fish and it will be added to your inventory.

# Todo

Future improvements to the game will include clearer instructions and keyword options, as well as more state-specific information when typing "help" (e.g. if you type "help" while in the middle of moving locations, it will tell you the location options).
I'd like to add more fishing locations, items players can catch (treasure or trash in addition to fish), and things to buy in the shop (or at least more types of / options for bait).
I'd also like to add an "aquarium" that stores your caught fish so they aren't just invisible items being lugged around (seemingly in your pockets).
