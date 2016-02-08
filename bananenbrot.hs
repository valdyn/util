module Main where

import Text.Printf


bananenbrot = 100 *** (bn /// bw) where 
    bw = 1096 -- Handgewogen nach dem Backen
    bn = (4.5 *** banane) +++ (1.50 *** apfel) +++ (0.75 *** haselnuss) +++ ((3 * 0.75) *** eier) +++ (3.0 *** dinkelmehl)
    apfel =      (  54  , 13.8, 0.2 ,  0.3)
    banane =     (  90  , 20  , 0.2 ,  1.2)
    haselnuss =  ( 661  , 10.5, 61.6, 12  )
    dinkelmehl = ( 353.0, 64.0, 2.6 , 14.2)
    eier =       ( 137.0,  1.5, 9.3 , 11.9)

m *** (e,c,f,p) = (m * e, m * c, m * f, m * p)
(e,c,f,p) /// d = (e / d, c / d, f / d, p / d)
(e1,c1,f1,p1) +++ (e2,c2,f2,p2) = (e1+e2,c1+c2,f1+f2,p1+p2)

pretty :: PrintfType r => String -> (Double, Double, Double, Double) -> r 
pretty s (e,c,f,p) = printf "%-15s %6.2f %6.2f %6.2f %6.2f\n" s e c f p   

header = "                cal    carbs  fats   proteins\n"

table = header ++
        pretty "Bananenbrot" bananenbrot
main = 
    putStrLn table 
