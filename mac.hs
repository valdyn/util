module Main where

import Text.Printf
import System.Environment(getArgs)

calc [a1, a2, a3 ] = s where
    c = (read :: String -> Double) a1 * 4.1
    f = (read :: String -> Double) a2 * 9.3
    p = (read :: String -> Double) a3 * 4.1
    t = c + f + p 
    s = [("Carbs:    %2.2f%%", 100 * c / t),
         ("Fats:     %2.2f%%", 100 * f / t),
         ("Proteins: %2.2f%%", 100 * p / t) ]

calc _ = [("Usage: mac <carbs> <fats> <proteins>",0)]

pretty = uncurry printf

main = do
    args <- getArgs
    mapM (putStrLn . pretty) (calc args)

