#!/usr/bin/env runghc
import Control.Applicative
import Control.Monad
import Data.Array

run::Array Int Int -> Int -> Int -> Int -> Int -> Int
run a (-1) cur r t = r
run a i cur r t = run a (i-1) nxt (max r nxt) t
	where
		nxt = cur + a!i - a!(i+t)
main = do
	[t,n] <- map (read :: String -> Int) . words <$> getLine
	a <- replicateM n (readLn :: IO Int)
	let s = sum (drop (n-t) a)
	putStrLn $ show $ run (listArray (0,n-1) a) (n-1-t) s s t

{-
mklist n
	| n>0 = do
		x <- (readLn :: IO Int)
		y <- mklist (n-1)
		return (x:y)
	| otherwise = return ([])
-}