type Point = (Int, Int)

step :: [String] -> Point -> Int -> Point -> Int
step rows (pos_x, pos_y) trees (slope_x, slope_y) =
  let height = length rows
      width = length $ head rows
      current = rows !! pos_y !! pos_x
      next_trees = trees + if current == '#' then 1 else 0
      (next_x, next_y) = (
        (pos_x + slope_x) `mod` width,
        pos_y + slope_y) in
    if next_y >= height then next_trees
    else step rows (next_x, next_y) next_trees (slope_x, slope_y)

main = do
  contents <- readFile "input.txt"
  let slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)] in
    print . product $ map (step (lines contents) (0, 0) 0) slopes
