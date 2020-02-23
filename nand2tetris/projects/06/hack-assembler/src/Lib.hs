{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wredundant-constraints #-}
{-# OPTIONS_GHC -Wincomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wincomplete-record-updates #-}
{-# OPTIONS_GHC -Widentities #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import qualified Data.Text as T
import Text.Megaparsec as Mpc
import Data.Void


type Parser = Parsec Void T.Text







