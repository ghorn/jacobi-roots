{-# OPTIONS_GHC -Wall #-}

module Main ( main ) where

import Data.List
import qualified Data.Vector as V

import JacobiRoots

main :: IO ()
main = do
  writeFile "foo_data.c" blah

allData :: [Double]
allData = concatMap V.toList $ V.toList allShiftedLegendreRoots

dataString :: String
dataString = "{" ++ intercalate ", " (map show allData) ++ "}"

blah :: String
blah = unlines
       [ "#define N " ++ show (length allData)
       , ""
       , "double foo_data[N] = " ++ dataString ++ ";"
       ]
