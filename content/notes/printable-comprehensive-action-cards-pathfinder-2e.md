---
title: "Printable, comprehensive action cards for Pathfinder 2e"
tags: ['pathfinder', 'original-content']
draft: false
---

To whom it may serve, [here](/pathfinder2e-action-cards.pdf) is a set of printable, comprehensive action cards I've just designed for Pathfinder 2e. Nothing fancy, it's mostly formatted-text, but still.

## Coverage

The set includes the following elements from the *Core Rulebook*:

- basic actions (that any character can perform most of the time)
- specialty basic actions (useful under specific circumstances), except for *Activate an Item*
- skill-related actions
- exploration and downtime activities

Actions from *Gamemastery Guide* and *Advanced Player's Guide* are not included (for now.)


## Rationale

My motivation is to selectively distribute such cards to willing players, according to the capabilities of their characters, so that:

- players are aware of the range of standard actions offered by the ruleset
- the effort to check most of the action rules is lowered from "browse the rulebook/Archives of Nethys" to "find and read the relevant card you already have in hand"
- players are empowered to contribute to the collective effort of obeying the spirit of the rules


## How this was made

I made the following design decisions:

- to allow for more content per card, I picked the Tarot format (70mm x 121mm = 2.75″ x 4.75″), which is bigger than the more traditional Poker format (63mm x 88mm = 2.5″ x 3.5″) while remaining convenient to Manipulate
- I had to reword, sometimes even truncate, some rules, to fit in the card format; when significant details were cut, I added a "See rulebook" mention
- as another trick to compress the information, I "invented" the *Trained* trait for actions that require the character to be Trained in a specific skill
- actions that have short descriptions and are closely-related to each other, are grouped in a single card
- *Activate an Item* is excluded because I couldn't find a concise way of describing it, other than just "check the item description", which defeats the purpose of making a card
- after trying many tools (namely *Inkscape*, *Karbon*, *Scribus*, *Python* & *Cairo*, *TeX*, *AbiWord*), to my own surprise I settled with *LibreOffice Writer* to design the cards, because experiments showed that it has the best "good-looking / time-consuming" ratio, notably because I am Untrained in graphics and also I realized a word-processor makes sense when most of the work involved is text-formatting
- my workflow to go from the ODT file to actual cards is:
  - export to PDF from *LibreOffice Writer* (built-in feature)
  - convert PDF to 1 image file per page using *ImageMagick* (you must be *Trained* in commandline): `convert -density 300 -trim cards.pdf -quality 100 card-%03d.jpg`
  - upload image files to an online card printer
