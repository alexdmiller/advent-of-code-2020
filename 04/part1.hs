import Data.List.Split (splitOn)
import Data.Set (Set, fromList, isSubsetOf)

main = do
  contents <- readFile "input.txt"
  print . length . filter
    (isSubsetOf (fromList ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]) . fromList . map (take 3) . words) $ splitOn "\n\n" contents
