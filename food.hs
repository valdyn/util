module Main where

import Text.Printf

kcal = 3000 :: Double

carbVal = 4.1
proteinVal = 4.1
fatVal = 9.3

carbs = (kcal - (fats * fatVal + proteins * proteinVal)) / carbVal :: Double
proteins = 100 :: Double
-- fats = kcal * 0.33 / 9.3 :: Double
fats = kcal * 0.30 / 9.3 :: Double

s = [("Energy:   %7.1fkcal", kcal),
     ("Fat:      %7.1fg"   , fats),
     ("Proteins: %7.1fg"   , proteins),
     ("Carb:     %7.1fg"   , carbs) ]

pretty = uncurry printf

main = mapM (putStrLn . pretty) s
