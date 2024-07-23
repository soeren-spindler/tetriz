#include "tetriz_piece.h"

void godot::TetrizPiece::_bind_methods()
{
	ClassDB::bind_method(D_METHOD("get_cell_coords"), &TetrizPiece::get_cell_coords);
	ClassDB::bind_method(D_METHOD("set_cell_coords", "new_cell_coords"), &TetrizPiece::set_cell_coords);

	ADD_PROPERTY(
		PropertyInfo(Variant::ARRAY, "cell_coords", PROPERTY_HINT_ARRAY_TYPE),
		"set_cell_coords",
		"get_cell_coords");

	ClassDB::bind_method(D_METHOD("get_collision_coords"), &TetrizPiece::get_collision_coords);
	ClassDB::bind_method(D_METHOD("set_collision_coords", "new_collision_coords"), &TetrizPiece::set_collision_coords);

	ADD_PROPERTY(
		PropertyInfo(Variant::ARRAY, "collision_coords", PROPERTY_HINT_ARRAY_TYPE),
		"set_collision_coords",
		"get_collision_coords");

	ClassDB::bind_method(D_METHOD("get_size"), &TetrizPiece::get_size);
}

godot::TetrizPiece::TetrizPiece()
{
}

godot::TetrizPiece::~TetrizPiece()
{
}

void godot::TetrizPiece::set_cell_coords(TypedArray<Vector2i> new_cell_coords)
{
	m_cell_coords = new_cell_coords;
	m_size = calculate_size();
}

godot::TypedArray<godot::Vector2i> godot::TetrizPiece::get_cell_coords() const
{
	return m_cell_coords;
}

void godot::TetrizPiece::set_collision_coords(TypedArray<Vector2i> new_collision_coords)
{
	m_collision_coords = new_collision_coords;
}

godot::TypedArray<godot::Vector2i> godot::TetrizPiece::get_collision_coords() const
{
	return m_collision_coords;
}

godot::Vector2i godot::TetrizPiece::get_size() const
{
	return m_size;
}

godot::Vector2i godot::TetrizPiece::calculate_size() const
{
	int x_max = 0;
	int y_max = 0;
	for (int64_t i = 0; i < m_cell_coords.size(); i++)
	{
		auto cell = (Vector2i)m_cell_coords[i];
		if (cell.x > x_max)
		{
			x_max = cell.x;
		}
		if (cell.y > y_max)
		{
			y_max = cell.y;
		}
	}
	return Vector2i(x_max + 1, y_max + 1);
}
