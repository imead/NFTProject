###################################### NFT Analysis ###################################################
### PROGRAM: NFTAnalysis.jl
### PURPOSE: 
### PROGRAMMER: Ivy Mead
### DATE AUTHORED: 04/10/22
### LANGUAGES: Julia, SQL
### PACKAGES/DEPENDENCIES:
### DATA SOURCES:
### END REPORTING:
########################################################################################################

## Download required Julia packages

## Load required Julia packages
using Pkg
using SQLite
using DataFrames


## Connect to SQLite NFT database and create in memory
NFTdb = SQLite.DB("nfts.sqlite");
con = DBInterface;

## Test load to DataFrame with LIMIT 50, table transfer_statistics_by_address
trans_stats_df = con.execute(NFTdb, "SELECT * FROM transfer_statistics_by_address LIMIT 50") |> DataFrame;

## VS Code plug in won't tell me length of string in address column.
## This is super useful for summary stats of DataFrame, like dplyr
describe(trans_stats_df::AbstractDataFrame; cols=:)

## Ran LENGTH in SQL which returned a length of 42 for the string

trans_stats_df = con.execute(NFTdb, "SELECT * FROM transfer_statistics_by_address") |> DataFrame;
describe(trans_stats_df::AbstractDataFrame; cols=:)

## Would like to tag some of these wallets as low, med, and high traffic
## Or maybe it will be more helpful to classify them as disposable wallets
## with single transaction in or out, those that are savings accounts
## type wallets, or those that are transactional wallets (flip).
## burning or burned is sending to wallet that can receive not send.

## NEED TO DETERMINE IF I KEEP OR RECODE ADDRESS STRING FOR DOWNSTREAM
## LOOK AT POPULATION AND DECIDE HOW TO BUCKET INTO MY CATEGORIES
## NEED TO RESEARCH MORE VIZ AND SUMMARY PACKAGES