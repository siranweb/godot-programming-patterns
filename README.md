# <img src="./icon.svg" width="24"> Godot Programming Patterns
[Russian](./README_RU.md) | English

This is Godot adaption of patterns of [Game Programming Patterns by Robert Nystrom](https://gameprogrammingpatterns.com/contents.html) book.

Prepared using **Godot v4.7.2**.

![cover](https://gameprogrammingpatterns.com/images/splash.jpg)

## How to use it
* Download this repository and open it with Godot.
* Open any pattern folder and launch the scene (like `01_command/command_example.tscn`).

## Patterns
### [Command](./01_command) [[Book](https://gameprogrammingpatterns.com/command.html)]
Scene: `01_command/command_example.tscn`

Implemented as the movement of two units, with the option to switch between them and undo moves.

![command_example](./docs/assets/command_example.jpg)

### [Flyweight](./02_flyweight) [[Book](https://gameprogrammingpatterns.com/flyweight.html)]
Scene: `02_flyweight/multi_mash_example.tscn`

Implemented using native [MultiMesh](https://docs.godotengine.org/en/stable/classes/class_multimeshinstance2d.html).
Renders 100k objects with simple animations. It is recommended to check performance from the debug menu.

Scene: `02_flyweight/bad_example.tscn`

A poor, unoptimized example for comparison.
Renders 100k [Sprite2D](https://docs.godotengine.org/en/stable/classes/class_sprite2d.html) with simple animations. It is recommended to check performance from the debug menu.

![flyweight_example](./docs/assets/flyweight_example.jpg)

### Observer [[Book](https://gameprogrammingpatterns.com/observer.html)]
No example. Natively implemented as [signals](https://docs.godotengine.org/en/stable/getting_started/introduction/key_concepts_overview.html#signals).

### [Prototype](./03_prototype) [[Book](https://gameprogrammingpatterns.com/prototype.html)]
Scene: `03_prototype/prototype_example.tscn`

Implemented using [`Node.duplicate()`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-duplicate). Spawns 2 types of monsters after a certain time interval.

![prototype_example](./docs/assets/prototype_example.jpg)