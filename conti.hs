module Main where

import System.Environment(getArgs)
import Text.Printf

maxX = 27;
inflation = 1.00;



format :: Integer -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> String 
format y s p q r t u v = printf (" %4i " ++
                         "| %7.0f " ++
                         "| %7.0f " ++
                         "| %7.0f " ++ 
                         "| %7.0f " ++ 
                         "| %7.0f " ++ 
                         "| %7.0f " ++
                         "| %7.0f ") y s p q r t u v :: String 

output [p] = printf "Savings per year: %.2f€\n" saving ++ 
              " Year |   Cum.  |   5.0%  |   6.0%  |   7.0%  |   8.0%  |  10.0%  |  12.0%  \n" ++ 
              "----------------------------------------------------------------------------\n" ++
                  concatMap (\y -> format (41+y) (save saving y) (real 1.05 past y) (real 1.06 past y) (real 1.07 past y) (real 1.08 past y) (real 1.10 past y) (real 1.12 past y)++
                      "\n") [0..maxX]
                    where 
                        real :: Double -> [Double] -> Integer -> Double
                        real i (p:ps) 0 = retire i p 0
                        real i [p] y = retire i p y
                        real i (p:ps) y = real i ps (y-1)

                        retire :: Double -> Double -> Integer -> Double
                        retire i s y = s*i^y + sum [(saving*(1+(i-1)/2)*inflation^(x-1))*i^(y-x) | x <- [1..y]]

                        final y = saving*inflation^y;

                        save saving 0 = 0
--                        save saving 1 = 21057.01
                        save saving y = sum [saving*inflation^(x-1) | x <- [1..y]]

                        past = [0]

                        saving = 12*(read :: String -> Double) p 




output _ = "Usage: retire <save>\n"

main = do
    args <- getArgs
    putStr $ output args               
