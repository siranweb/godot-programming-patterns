extends Node2D
class_name GameOfLife

# Some settings. Customize if you want
const _GRID_WIDTH: int = 160
const _GRID_HEIGHT: int = 90
const _CELLS_SIZE: int = 8
const _TICKS_PER_SECOND: float = 12.0 # simulation speed
const _BG_COLOR: Color = Color(0.1, 0.1, 0.15)
const _ALIVE_COLOR: Color = Color(0.2, 0.9, 0.4)

var _current_grid: PackedByteArray
var _next_grid: PackedByteArray
var _time_since_last_tick: float = 0.0

func _ready() -> void:
	var total_cells: int = _GRID_WIDTH * _GRID_HEIGHT
	_current_grid.resize(total_cells)
	_next_grid.resize(total_cells)

	for i in range(total_cells):
		_current_grid[i] = 1 if randi() % 2 == 0 else 0

	queue_redraw()

func _process(delta: float) -> void:
	_time_since_last_tick += delta

	if _time_since_last_tick >= 1.0 / _TICKS_PER_SECOND:
		_time_since_last_tick -= 1.0 / _TICKS_PER_SECOND
		_step_simulation()
		queue_redraw()

func _step_simulation() -> void:
	for y in range(_GRID_HEIGHT):
		for x in range(_GRID_WIDTH):
			var idx: int = y * _GRID_WIDTH + x
			var is_alive: bool = _current_grid[idx] == 1
			var neighbors: int = _count_neighbors(x, y)

			if is_alive:
				_next_grid[idx] = 1 if (neighbors == 2 or neighbors == 3) else 0
			else:
				_next_grid[idx] = 1 if neighbors == 3 else 0

	# Swapping (!)
	var temp: PackedByteArray = _current_grid
	_current_grid = _next_grid
	_next_grid = temp


func _count_neighbors(x: int, y: int) -> int:
	var count: int = 0

	for dy in range(-1, 2):
		for dx in range(-1, 2):
			if dx == 0 and dy == 0:
				continue

			# Looped world. If out of bounds - appears from the other side.
			var nx: int = (x + dx + _GRID_WIDTH) % _GRID_WIDTH
			var ny: int = (y + dy + _GRID_HEIGHT) % _GRID_HEIGHT
			count += _current_grid[ny * _GRID_WIDTH + nx]

	return count

func _draw() -> void:
	var bg_rect: Rect2 = Rect2(0, 0, _GRID_WIDTH * _CELLS_SIZE, _GRID_HEIGHT * _CELLS_SIZE)
	draw_rect(bg_rect, _BG_COLOR)

	for y in range(_GRID_HEIGHT):
		for x in range(_GRID_WIDTH):
			if _current_grid[y * _GRID_WIDTH + x] == 1:
				var cell_rect: Rect2 = Rect2(x * _CELLS_SIZE, y * _CELLS_SIZE, _CELLS_SIZE, _CELLS_SIZE)
				draw_rect(cell_rect, _ALIVE_COLOR)