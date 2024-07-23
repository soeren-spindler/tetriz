#ifndef __TETRIZ_PIECE_H__
#define __TETRIZ_PIECE_H__

#include <godot_cpp/classes/resource.hpp>

namespace godot
{

	class TetrizPiece : public Resource
	{
		GDCLASS(TetrizPiece, Resource)

	protected:
		static void _bind_methods();

	public:
		TetrizPiece();
		~TetrizPiece();

		void set_cell_coords(TypedArray<Vector2i> new_cell_coords);
		TypedArray<Vector2i> get_cell_coords() const;

		void set_collision_coords(TypedArray<Vector2i> new_collision_coords);
		TypedArray<Vector2i> get_collision_coords() const;

		Vector2i get_size() const;

	private:
		TypedArray<Vector2i> m_cell_coords;
		TypedArray<Vector2i> m_collision_coords;
		Vector2i m_size;

		Vector2i calculate_size() const;
	};

} // namespace godot

#endif // __TETRIZ_PIECE_H__