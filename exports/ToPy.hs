{-# OPTIONS_GHC -Wall #-}

module Main ( main ) where

import qualified Data.Vector as V

import JacobiRoots

main :: IO ()
main = do
  writeFile "foo.py" blah

allData :: V.Vector (V.Vector Double) -> [[Double]]
allData roots = map V.toList $ V.toList roots

toPyFun :: String -> V.Vector (V.Vector Double) -> String
toPyFun name roots =
  unlines $
  [ "def get_shifted_" ++ name ++ "_roots():"
  , "    return " ++ show (allData roots)
  ]

blah :: String
blah = toPyFun "legendre" allShiftedLegendreRoots ++ "\n" ++ 
       toPyFun "radau"    allShiftedRadauRoots
