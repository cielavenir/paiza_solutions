#!/usr/bin/env runghc
--import Debug.Trace
--debug code and seq (strict evaluation) from http://www.geocities.jp/m_hiroi/func/haskell05.html

import Control.Applicative
import Control.Monad

-- 1.82s/1.82s
run::[Int] -> [Int] -> Int -> Int -> Int
run a b r cur
	| null b = r
	| otherwise =
		let nxt = cur + (head b) - (head a) in
		nxt `seq` run (tail a) (tail b) (max r nxt) nxt
main = do
	[t,n] <- map (read :: String -> Int) . words <$> getLine
	a <- replicateM n (readLn :: IO Int)
	let s = sum (take t a)
	print $ run a (drop t a) s s

{-
-- 1.77s/1.77s
-- refer to https://gist.github.com/tanakh/7764127
import qualified Data.Vector.Unboxed as V
import Data.Vector.Unboxed ((!))
main = do
	[t,n] <- map (read :: String -> Int) . words <$> getLine
	_a <- replicateM n (readLn :: IO Int)
	let s = sum (drop (n-t) _a)
	let a = V.fromList _a
	let run i r cur
		| i==(-1) = r
		| otherwise =
			let nxt = cur + a!i - a!(i+t) in
			nxt `seq` run (i-1) (max r nxt) nxt
	print $ run (n-1-t) s s
-}

{-
mklist n
	| n>0 = do
		x <- (readLn :: IO Int)
		y <- mklist (n-1)
		return (x:y)
	| otherwise = return ([])
-}