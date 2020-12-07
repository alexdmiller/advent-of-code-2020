import Data.List.Split (splitOn)
import Data.Set (Set, fromList, difference, singleton)

main = do
  contents <- readFile "input.txt"
  let required = fromList ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
      passports = splitOn "\n\n" contents in
    print . length . filter
      (check . difference required . fromList . map (take 3) . words) $ passports

check :: Set [Char] -> Bool
check set = set == singleton "cid" || null set
