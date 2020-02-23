{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment as SysEnv
import qualified Data.Text.IO as TIO

import qualified Data.Text as T
import Text.Megaparsec as Mpc
import Text.Megaparsec.Char as MpcChar
import Data.Void


--import Lib

{-
main :: IO ()
main = do 
    args <- SysEnv.getArgs
    fContents <- TIO.readFile . head $ args
    TIO.putStrLn fContents
-}

type Parser = Parsec Void T.Text


main :: IO()
main = do
    Mpc.parseTest (MpcChar.string "foo" :: Parser T.Text) "fooo"

