module Main where

import Text.Printf

ekuchen = perHundred nutrition weight where
    weight = 1170 -- Handgewogen nach dem Backen
    nutrition = (2.5 *** butter) +++ (1.50 *** staerke) +++ (1.0 *** zitronat) +++ (1.5 *** rosinen) +++ (0.75 *** haselnuss) +++ ((5 * 0.75) *** eier) +++ (2.5 *** vollkornmehl) +++ (2.0 *** zucker)

bananenbrot = perHundred nutrition weight where 
    weight = 1096 -- Handgewogen nach dem Backen
    nutrition = (4.5 *** banane) +++ (1.50 *** apfel) +++ (0.75 *** haselnuss) +++ ((3 * 0.75) *** eier) +++ (3.0 *** dinkelmehl)

hummus = perHundred nutrition weight where
    weight = 15 + 120 + 10 -- Nach Rezept
    nutrition = (0.15 *** tahin) +++ (1.2 *** kichererbsen) +++ (0.1 *** olivenoel)

apfel =        ( 54.0,13.8, 0.2, 0.3)
banane =       ( 90.0,20  , 0.2, 1.2)
butter =       (741.0, 0.6,82.2, 0.7)
dinkelmehl =   (353.0,64.0, 2.6,14.2)
eier =         (137.0, 1.5, 9.3,11.9)
haselnuss =    (661.0,10.5,61.6,12  )
rosinen =      (314.0,68.0, 0.6, 2.5)
staerke =      (320.0,80  , 0.0, 0.0)
vollkornmehl = (325.0,59.5, 1.8,11.7)
zitronat =     (220.0,60.5, 0.3, 0.2)
zucker =       (405.0,99.8, 0.0, 0.0)
tahin =        (634.0,10.5,60.1,25.5)
olivenoel =    (828.0, 0.0,92.0, 0.0)
kichererbsen = ( 72.0,13.0, 0.8, 5.0)

perHundred n w = 100 *** (n /// w)

m *** (e,c,f,p) = (m * e, m * c, m * f, m * p)
(e,c,f,p) /// d = (e / d, c / d, f / d, p / d)
(e1,c1,f1,p1) +++ (e2,c2,f2,p2) = (e1+e2,c1+c2,f1+f2,p1+p2)

pretty :: PrintfType r => String -> (Double, Double, Double, Double) -> r 
pretty s (e,c,f,p) = printf "%-15s %6.2f %6.2f %6.2f %6.2f\n" s e c f p   

header = "                cal    carbs  fats   proteins\n"

table = header ++
        pretty "Bananenbrot" bananenbrot ++
        pretty "Engl. Kuchen" ekuchen ++
        pretty "Hummus" hummus 

main = 
    putStrLn table 
