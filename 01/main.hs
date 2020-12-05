main = do
  -- read in list of numbers
  contents <- readFile "input.txt"
  -- parse numbers into a list
  let nums = map readInt $ words contents
  -- find pair of numbers that adds to 2020
  let triple = head [ [x, y, z] | x <- nums, y <- nums, z <- nums, x + y + z == 2020 ]
  -- multiply the pair and print
  print $ product triple

readInt :: String -> Int
readInt = read