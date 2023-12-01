import Data.Char (isDigit)
import System.IO

digitsFromStr :: String -> [Int]
digitsFromStr = map (\c -> read [c]) . filter isDigit

joinDigits :: [Int] -> Int
joinDigits [x] = read (show x ++ show x)
joinDigits (l:ls) = read (show l ++ show (last ls))

takeCalibration :: String -> Int
takeCalibration s = joinDigits $ digitsFromStr s

main :: IO ()
main = do
  handle <- openFile "input_1.txt" ReadMode

  processLines handle

  hClose handle

processLines :: Handle -> IO ()
processLines handle = do
  eof <- hIsEOF handle
  if eof
    then return ()
    else do
      line <- hGetLine handle
      takeCalibration line

      processLines handle

      --this is breaking and Haskell is a pain in the ass to handle IO
      --droppping this and moting on to Python
