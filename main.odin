package main

import "core:fmt"
import rl "vendor:raylib"

vec2i :: [2]int

GRID_WIDTH :: 20
CELL_SIZE :: 16

CANVAS_SIZE :: GRID_WIDTH*CELL_SIZE

TICK_RATE :: 0.13

snakeHeadInitialPos : [2]int = {GRID_WIDTH/2, GRID_WIDTH/2}
tickTimer: f32 = TICK_RATE

snake: [100]vec2i
currentLength :: 0

moveDirection: vec2i = {0, 1}

main :: proc() {

  rl.SetConfigFlags({.VSYNC_HINT})
  rl.InitWindow(1366, 768, "Snake")

  snake[0] = snakeHeadInitialPos
  snake[1] = snakeHeadInitialPos + {0, -1}
  snake[2] = snakeHeadInitialPos + {0, -2}
  snake[3] = snakeHeadInitialPos + {0, -3}



  for !rl.WindowShouldClose() {

    if rl.IsKeyDown(.UP){
      moveDirection = {0, -1}
    }

    if rl.IsKeyDown(.DOWN){
      moveDirection = {0, 1}
    }

    if rl.IsKeyDown(.LEFT){
      moveDirection = {-1, 0}
    }

    if rl.IsKeyDown(.RIGHT){
      moveDirection = {1, 0}
    }

    tickTimer -= rl.GetFrameTime()

    if (tickTimer <= 0){
      //snakeHeadPos += moveDirection
      tickTimer = TICK_RATE + tickTimer
    }

    rl.BeginDrawing()
    rl.ClearBackground({0, 0, 0, 255})

    camera := rl.Camera2D{ zoom = 2}

    rl.BeginMode2D(camera)

    headRect := rl.Rectangle{f32(snakeHeadPos.x*CELL_SIZE), f32(snakeHeadPos.y*CELL_SIZE), f32(CELL_SIZE), f32(CELL_SIZE)}

    rl.DrawRectangleRec(headRect, rl.WHITE)

    rl.EndMode2D()
    rl.EndDrawing()
  }

  rl.CloseWindow()

}