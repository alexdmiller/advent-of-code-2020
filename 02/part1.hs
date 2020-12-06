
import Data.List.Split (splitOn)

main = do
  contents <- readFile "input.txt"
  print . length . filter testPassword . map words $ lines contents

testPassword :: [String] -> Bool
testPassword [range, char, pass] =
  let [min, max] = map readInt $ splitOn "-" range
      c = head char
      l = length $ filter (==c) pass in
        l >= min && l <= max

readInt :: String -> Int
readInt = read