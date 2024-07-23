#ifndef __TETRIZ_BOARD_H__
#define __TETRIZ_BOARD_H__

#include <godot_cpp/classes/tile_map_layer.hpp>

namespace godot
{

    class TetrizBoard : public TileMapLayer
    {
        GDCLASS(TetrizBoard, TileMapLayer)

    protected:
        static void _bind_methods();

    public:
        TetrizBoard();
        ~TetrizBoard();
    };

} // namespace godot

#endif // __TETRIZ_BOARD_H__