# Untitled Origami Game

You could have different "folds" (characters) you select before a level (kind of
like TBW). Selecting a fold will give you a small number of "blanks" which you
can turn into that kind of troop in game. You have a limited number of slots so
you can only take a small number of folds with you. This would make up your
entire puzzle inventory and you then have to find a way to beat the level with
only the amount and variety of troops you've chosen.

## Units

Units are instances of [folds](##Folds) that exist on the [game board](##Board).
They are made of [material](##Material) and can interact with other units and
the [environment](##Environment). When placed, they consume one material of the
type they are assigned.

### Airlane

The paper airplane is one of the most basic units in the game. It moves in a
straight "+" shape and collides with the first object it hits, removing both it
and its target from the [game board](##Board). It can go over water and it's
[A4](##A4) variant can resist one hit before getting removed, crumpling its nose
in the process.

## Folds

Folds are the "blueprints" of every unit. They describe what the final shape of
the paper will be regardless of material. Different folds give units different
movement and abilities, and those can further be augmented with material choice.

## Materials

### A4

Standard material. Solid middleground.
