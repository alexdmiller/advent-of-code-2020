
import Data.List.Split (splitOn)

main = do
  contents <- readFile "input.txt"
  print . length . filter testPassword . map words $ lines contents

testPassword :: [String] -> Bool
testPassword [range, char, pass] =
  let indexes = map (subtract 1 . readInt) $ splitOn "-" range
      c = head char in
  (length . filter (==c) . map (pass !!)) indexes == 1

readInt :: String -> Int
readInt = read
