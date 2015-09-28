{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )
-- import Shelly (shelly)

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-command-not-found"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-i-know"
  , bundle "mafredri/zsh-async"
  , bundle "sindresorhus/pure"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  -- , developFromFileSystem "/home/arash/repos/zsh-snakebite-completion"
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
-- main = shelly $ antigen config 
main = antigen config
