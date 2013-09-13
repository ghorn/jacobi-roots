{-# OPTIONS_GHC -Wall #-}

-- | Get the roots of shifted Legendre and Radau polynomials
--
-- >>> shiftedLegendreRoots 3
-- Just (fromList [0.11270166537925831,0.5,0.8872983346207417])
-- >>>  shiftedRadauRoots 2
-- Just (fromList [0.1550510257216822,0.6449489742783178])
--
-- The roots are pre-computed and only a finite number are provided
--
-- >>> (V.length allShiftedLegendreRoots, V.length allShiftedRadauRoots)
-- (301,301)
-- >>>  shiftedLegendreRoots 1000000000000000
-- Nothing
--
-- There are N roots in the Nth Jacobi polynomial
--
-- >>> import Data.Maybe ( fromJust )
-- >>> V.length (fromJust (shiftedLegendreRoots 5))
-- 5
-- >>> all (\k -> k == V.length (fromJust (shiftedLegendreRoots k))) [0..(V.length allShiftedLegendreRoots - 1)]
-- True
-- >>> all (\k -> k == V.length (fromJust (shiftedRadauRoots k))) [0..(V.length allShiftedRadauRoots - 1)]
-- True

module JacobiRoots
       ( shiftedLegendreRoots
       , shiftedRadauRoots
       , allShiftedLegendreRoots
       , allShiftedRadauRoots
       ) where

import Data.Binary ( decode )
import qualified Data.Vector as V
import Data.Vector ( (!?) )

import JacobiRootsBinary ( allShiftedLegendreRootsBinary, allShiftedRadauRootsBinary )

-- | get the roots of the Nth shifted Legendre polynomial
--
-- @
-- 'shiftedLegendreRoots' == ('allShiftedLegendreRoots' '!?')
-- @
--
-- >>> mapM_ (print . shiftedLegendreRoots) [0..3]
-- Just (fromList [])
-- Just (fromList [0.5])
-- Just (fromList [0.2113248654051871,0.7886751345948129])
-- Just (fromList [0.11270166537925831,0.5,0.8872983346207417])
shiftedLegendreRoots :: Int -> Maybe (V.Vector Double)
shiftedLegendreRoots = (allShiftedLegendreRoots !?)

-- | get the roots of the Nth shifted Radau polynomial
--
-- @
-- 'shiftedRadauRoots' == ('allShiftedRadauRoots' '!?')
-- @
--
-- >>> mapM_ (print . shiftedRadauRoots) [0..3]
-- Just (fromList [])
-- Just (fromList [0.3333333333333333])
-- Just (fromList [0.1550510257216822,0.6449489742783178])
-- Just (fromList [8.858795951270394e-2,0.4094668644407347,0.787659461760847])
shiftedRadauRoots :: Int -> Maybe (V.Vector Double)
shiftedRadauRoots = (allShiftedRadauRoots !?)


-- | roots of shifted Jacobi polynomials with alpha=0, beta=0
allShiftedLegendreRoots :: V.Vector (V.Vector Double)
allShiftedLegendreRoots = V.fromList $ map V.fromList $ decode allShiftedLegendreRootsBinary

-- | roots of shifted Jacobi polynomials with alpha=1, beta=0
allShiftedRadauRoots :: V.Vector (V.Vector Double)
allShiftedRadauRoots = V.fromList $ map V.fromList $ decode allShiftedRadauRootsBinary
