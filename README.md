# pathfinding

Template project to add pathfinding for enemy agents

## Guide

### Scenes

Note that this template focuses on navigation. There is no fighting mechanism.

The following has been implemented for you:

1. Map

There are two layers to the map: `Background` and `Obstacles`.

* `Background` covers every tile and does not affect movement or collision.
* `Obstacle` covers every tile, with navigable tiles being grass and obstacles being trees.

Collision shape has been added to the obstacle tiles.

Assets are located at `/assets/SproutLands/Objects` and `/assets/SproutLands/Tilesets`.

2. Player

Basic movement is implemented: left, right, up, down.

Assets are located at `/assets/SproutLands/Characters`.

3. Enemy

Logic for movement is empty for now.

### Collision

#### Layers

* Map: 2
* Player: 1
* Enemy: 3

#### Masks

* Map: no mask
* Player: 2, 3
* Enemy: 1, 2

## Acknowledgements

Assets are obtained from [Sprout Lands](https://cupnooble.itch.io/sprout-lands-asset-pack)
