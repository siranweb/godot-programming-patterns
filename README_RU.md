# <img src="./icon.svg" width="24"> Паттерны программирования в Godot
Russian | [English](./README.md)

Адаптация паттернов в Godot из книги [Шаблоны игрового программирования Роберта Найстрома](https://jabocrack1.gitbook.io/shabloni-igrovogo-programmirovaniya).

Подготовлено на **Godot v4.7.2**.

![cover](https://gameprogrammingpatterns.com/images/splash.jpg)

## Как пользоваться
* Скачайте этот репозиторий и откройте его через Godot.
* Откройте любую директорию паттерна и запустите сцену (например, `01_command/command_example.tscn`).

## Паттерны
### [Команда (Command)](./01_command) [[Книга](https://jabocrack1.gitbook.io/shabloni-igrovogo-programmirovaniya/obzor-shablonov-proektirovaniya/komanda-command)]
Сцена: `01_command/command_example.tscn`

Реализован в виде передвижения двух юнитов, с возможностью переключения и отмены ходов.

![command_example](./docs/assets/command_example.jpg)

### [Приспособленец (Легковес, Flyweight)](./02_flyweight) [[Книга](https://jabocrack1.gitbook.io/shabloni-igrovogo-programmirovaniya/obzor-shablonov-proektirovaniya/prisposoblenets-flyweight)]
Сцена: `02_flyweight/multi_mash_example.tscn`

Реализован с использованием нативного [MultiMesh](https://docs.godotengine.org/ru/4.x/classes/class_multimeshinstance2d.html).
Рендерит 100к объектов с простыми анимациями. Рекомендуется проверить производительность из меню отладки.

Сцена: `02_flyweight/bad_example.tscn`

Плохой, неоптимизированный пример для сравнения.
Рендерит 100к [Sprite2D](https://docs.godotengine.org/ru/4.x/classes/class_sprite2d.html#) с простыми анимациями. Рекомендуется проверить производительность из меню отладки.

![flyweight_example](./docs/assets/flyweight_example.jpg)

### Наблюдатель (Observer) [[Книга](https://jabocrack1.gitbook.io/shabloni-igrovogo-programmirovaniya/obzor-shablonov-proektirovaniya/nablyudatel-observer)]
Пример отсутствует. Нативно реализован в виде [сигналов](https://docs.godotengine.org/ru/4.x/getting_started/introduction/key_concepts_overview.html#signals).

### [Прототип (Prototype)](./03_prototype) [[Книга](https://jabocrack1.gitbook.io/shabloni-igrovogo-programmirovaniya/obzor-shablonov-proektirovaniya/prototip-prototype)]
Сцена: `03_prototype/prototype_example.tscn`

Реализован с помощью [`Node.duplicate()`](https://docs.godotengine.org/ru/4.x/classes/class_node.html#class-node-method-duplicate). Спавнит 2 типа монстров через промежуток времени.

![prototype_example](./docs/assets/prototype_example.jpg)