type Point = (Int, Int)

step :: [String] -> Point -> Point -> Int -> Int
step rows (slope_x, slope_y) (pos_x, pos_y) trees =
  let height = length rows
      width = length $ head rows
      current = rows !! pos_y !! pos_x
      next_trees = trees + if current == '#' then 1 else 0
      (next_x, next_y) = (
        (pos_x + slope_x) `mod` width,
        pos_y + slope_y) in
    if next_y >= height then next_trees
    else step rows (slope_x, slope_y) (next_x, next_y) next_trees

main = do
  contents <- readFile "input.txt"
  print (step (lines contents) (3, 1) (0, 0) 0)

