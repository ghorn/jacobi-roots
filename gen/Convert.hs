{-# OPTIONS_GHC -Wall #-}

module Main ( main ) where

import Data.Binary ( encode )

import JacobiRootsRaw300

main :: IO ()
main = do
  writeFile "../src/JacobiRootsBinary.hs" blah

blah :: String
blah = unlines
       [ "{-# OPTIONS_GHC -Wall #-}"
       , "{-# Language OverloadedStrings #-}"
       , ""
       , "module JacobiRootsBinary ( allShiftedLegendreRootsBinary, allShiftedRadauRootsBinary ) where"
       , ""
       , "import Data.ByteString.Lazy ( ByteString )"
       , ""
       , "allShiftedLegendreRootsBinary :: ByteString"
       , "allShiftedLegendreRootsBinary = " ++ show (encode allShiftedLegendreRootsRaw)
       , ""
       , "allShiftedRadauRootsBinary :: ByteString"
       , "allShiftedRadauRootsBinary = " ++ show (encode allShiftedRadauRootsRaw)
       ]
