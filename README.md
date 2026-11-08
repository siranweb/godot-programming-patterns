# <img src="./icon.svg" width="24"> Godot Programming Patterns
[Russian](./README_RU.md) | English

This is Godot adaption of patterns of [Game Programming Patterns by Robert Nystrom](https://gameprogrammingpatterns.com/contents.html) book.

This repository was created primarily for my own practice in analyzing these patterns.

Prepared using **Godot v4.7.2** and **GDScript**.

![cover](https://gameprogrammingpatterns.com/images/splash.jpg)

## How to use it
Below I made list of patterns from the book.

Some patterns have implementation, some not. I left some links to godot docs where it makes sense.

* Download this repository and open it with Godot.
* Open any pattern folder and launch the scene (like `01_command/command_example.tscn`).

## Contribution
Feel free to open a PR, if you disagree with something or would like to add more examples. Some of the patterns are need it.

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

### Singleton [[Book](https://gameprogrammingpatterns.com/singleton.html)]
No example. Can be easily implemented using [autoload](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html).
It is better to look at the reasons why the author advises against using it.

### [State](./04_state) [[Book](https://gameprogrammingpatterns.com/state.html)]
Scene: `04_state/fsm_example.tscn`

Simple implementation of moving [CharacterBody2D](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html) using Finite State Machine.

Also, take a look at other FSM implementations: [gdquest](https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/), [gd-YAFSM](https://github.com/imjp94/gd-YAFSM), [Machina](https://github.com/sempitern0/machina)... There are lots of them.

![fsm_example](./docs/assets/fsm_example.jpg)

Scene: `04_state/csm_example.tscn`

Simple implementation of moving [CharacterBody2D](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html) with weapon attack using several FSMs (Concurrent State Machines).

![csm_example](./docs/assets/csm_example.jpg)

*I'm too lazy to implement Hierarchical or Pushdown Automata. That's not much harder when you understand simple FSMs.*

### [Double Buffering](./05_double_buffering) [[Book](https://gameprogrammingpatterns.com/double-buffer.html)]
Scene: `05_double_buffering/double_buffering_example.tscn`

Implemented as [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) using [`CanvasItem._draw()`](https://docs.godotengine.org/en/stable/classes/class_canvasitem.html#class-canvasitem-private-method-draw).

![double_buffering_example](./docs/assets/double_buffering_example.jpg)

### Game Loop [[Book](https://gameprogrammingpatterns.com/game-loop.html)]
See [SceneTree](https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree).

### Update method [[Book](https://gameprogrammingpatterns.com/update-method.html)]
See [Godot notifications](https://docs.godotengine.org/en/stable/tutorials/best_practices/godot_notifications.html), especially `_process`/`_physics_process`.

### Bytecode [[Book](https://gameprogrammingpatterns.com/bytecode.html)]
Really difficult section to implement. Godot already has [GDScriptVM](https://deepwiki.com/godotengine/godot/6.3-gdscript-compiler-and-vm), so you can use it as advantage - no need to implement your own language.
Just need to be careful with allowed APIs.
It's recommended to use [Resources](https://docs.godotengine.org/en/stable/classes/class_resource.html) so anyone can make balancing edits without modifying source code.
In case if your logic too complicated or dynamic (like cards in Slay the Spire 2) other patterns like **Command** can help.

In case with mods, check out Brotato [modding guide](https://brotato.wiki.spellsandguns.com/Modding), which also uses [Godot Mod Loader](https://wiki.godotmodding.com/).

### [Subclass Sandbox](./06_subclass_sandbox) [[Book](https://gameprogrammingpatterns.com/subclass-sandbox.html)]
Scene: `06_subclass_sandbox/subclass_sandbox_example.tscn`

Pattern implemented as shooting with 2 modes.

![subclass_sandbox_example](./docs/assets/subclass_sandbox_example.jpg)

### [Type Object](./07_type_object) [[Book](https://gameprogrammingpatterns.com/type-object.html)]
Scene: `07_type_object/type_object_example.tscn`

Implemented using Resource.

![type_object_example](./docs/assets/type_object_example.jpg)

## [Component](./08_component) [[Book](https://gameprogrammingpatterns.com/component.html)]
Scene: `08_component/component_example.tscn`

Two cats. The one controlled by you, another - automatically.

*[Asset](https://bowpixel.itch.io/meow-cat-85-animation) by bowpixel*

![component_example](./docs/assets/component_example.jpg)

## Event Queue [[Book](https://gameprogrammingpatterns.com/event-queue.html)]
No example. Use [`call_deferred()`](https://docs.godotengine.org/en/stable/classes/class_callable.html#class-callable-method-call-deferred) for methods or [`CONNECT_DEFERRED`](https://docs.godotengine.org/en/stable/classes/class_object.html#enumerations) for signals.
If it's not enough, can be easily implemented using array + `pop_front()`.

And there some implementation of [Event Bus](https://dev.to/bajathefrog/riding-the-event-bus-in-godot-ped).

## [Service Locator](./09_service_locator) [[Book](https://gameprogrammingpatterns.com/service-locator.html)]
Scene: `09_service_locator/service_locator_example.tscn`

Implemented as autoloaded singleton.

![service_locator_example](./docs/assets/service_locator_example.jpg)

## Data Locality [[Book](https://gameprogrammingpatterns.com/data-locality.html)]
No need to implement. See [CPU optimization](https://docs.godotengine.org/en/stable/tutorials/performance/cpu_optimization.html#).

## Dirty Flag [[Book](https://gameprogrammingpatterns.com/dirty-flag.html)]
No need to implement.

## [Object Pool](./10_object_pool) [[Book](https://gameprogrammingpatterns.com/object-pool.html)]
Scene: `10_object_pool/object_pool_example.tscn`

Mage shoots spheres from he's spheres pool.

![object_pool_example](./docs/assets/object_pool_example.jpg)

## Spatial Partition [[Book](https://gameprogrammingpatterns.com/spatial-partition.html)]
Too lazy to implement such special case. There are many structures that you can use. That's need some investigation.