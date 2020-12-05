main = do
  -- read in list of numbers
  contents <- readFile "input.txt"
  -- parse numbers into a list
  let nums = map readInt $ words contents
  -- find pair of numbers that adds to 2020
  let pair = head [ (x, y) | x <- nums, y <- nums, x + y == 2020 ]
  -- multiply the pair and print
  print $ uncurry (*) pair

readInt :: String -> Int
readInt = read