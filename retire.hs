module Main where

import Text.Printf

maxX = 20;
saving = 12000;
inflation = 1.00;
interest = 1.07;
current = 150000;

final = saving*inflation^maxX;
save = sum [saving*inflation^(x-1) | x <- [1..maxX]]
retire = current*interest^maxX + sum [(saving*inflation^(x-1))*interest^(maxX-x) | x <- [1..maxX]]

format :: Double -> Double -> Double -> String 
format f s r = printf ("Final:  %10.2f\n" ++
                       "Save:   %10.2f\n" ++ 
                       "Retire: %10.2f") f s r :: String 

main = 
    putStrLn (format final save retire)
--               
