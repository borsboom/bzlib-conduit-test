-- | Main entry point to the application.
module Main where

import Data.Conduit.BZlib
import Data.Conduit.Binary
import Data.Conduit

-- | The main entry point.
main :: IO ()
main = do
    lbs <- runResourceT $ sourceFile "test.txt.bz2" =$= decompress def $$ sinkLbs
    putStrLn $ show lbs
