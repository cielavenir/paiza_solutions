#!/usr/bin/env runghc
import Control.Applicative
import Control.Monad
import Data.Array

run a i cur r t n
	| i==n = r
	| otherwise = do
		let nxt = if i<t then (cur + a!i) else (cur + a!i - a!(i-t))
		run a (i+1) nxt (max r nxt) t n
main = do
	[t,n] <- map (read :: String -> Int) . words <$> getLine
	a <- replicateM n (readLn :: IO Int)
	putStrLn $ show $ run (listArray (0,n-1) a) 0 0 0 t n

--mklist n
--	| n>0 = do
--		x <- (readLn :: IO Int)
--		y <- mklist (n-1)
--		return (x:y)
--	| otherwise = return ([])