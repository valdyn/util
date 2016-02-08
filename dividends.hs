module Main where

import Text.Printf

shares = (["Basf", "Henkel", "Munich Re", "Nokia", "IBM"],
          [[(285.0, 2.80), ( 119.0, 1.31),(  91.0, 7.75),(2234.0, 0.14),(  32.0, 3.77)],
           [(285.0, 2.89), ( 119.0, 1.47),(  91.0, 8.25),(2234.0, 0.15),(  106.0, 4.57)],
           [(285.0, 3.99), ( 119.0, 1.59),(  91.0, 8.29),(2234.0, 0.18),(  106.0, 4.78)],
           [(285.0, 4.12), ( 119.0, 1.72),(  91.0, 8.55),(2234.0, 0.20),(  106.0, 5.03)]])

dividend (n,v) = n * v

sumDividends s = map  (sum . map dividend) (snd s) 

format :: Int -> Double -> String 
format y s = printf "%4d: %8.2f %8.2f" y s (700+(s-700)*0.73) :: String 

pretty :: [Double] -> [String]
pretty = zipWith format [2014..] 

main = 
    mapM_ putStrLn (pretty $ sumDividends shares)
--               
