module Main where

import Text.Printf

shares = (["Basf", "Henkel", "Munich Re", "Nokia", "IBM"],
{- 2014 -}           [[(285.0, 2.80), ( 119.0, 1.31),(  91.0, 7.75),(2434.0, 0.14),(   32.0, 3.87)],
{- 2015 -}            [(337.0, 2.90), ( 119.0, 1.47),(  91.0, 8.25),(2434.0, 0.16),(  106.0, 4.55)],
{- 2016 -}            [(337.0, 2.96), ( 119.0, 1.59),(  91.0, 8.43),(2434.0, 0.19),(  106.0, 4.76)],
{- 2017 -}            [(337.0, 3.06), ( 119.0, 1.74),(  91.0, 8.66),(2434.0, 0.19),(  106.0, 5.03)]])

dividend (n,v) = n * v

sumDividends s = map  (sum . map dividend) (snd s) 

format :: Int -> Double -> String 
format y s = printf "%4d: %8.2f %8.2f" y s (700+(s-700)*0.73) :: String 

pretty :: [Double] -> [String]
pretty = zipWith format [2014..] 

main = 
    mapM_ putStrLn (pretty $ sumDividends shares)
--               
