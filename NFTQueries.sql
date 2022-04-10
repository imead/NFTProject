-- Trying to figure out which tables might be the most interesting to work with.
-- Also would like to separate larger tables into half for training and testing datasets.

-- SQLite does not use TOP, instead uses LIMIT
-- Small simple table aggregating bins for number of holds for lengths of time.
SELECT days, num_holds
FROM mint_holding_times;

-- May want to join on NFT_ADDRESS for MARKET_VALUE
-- TOKEN_ID is the specific NFT identifier, a wallet (NFT_ADDRESS) can have multiple NFTs in it.
-- Running into integer overflow error which is new for me, associated with SUM, too many numbers in market value
-- switched to AVG. Market value is key here.
-- Get list of top 50 NFT wallets in dataset. Top wallet has ~206,000
SELECT 
    nft_address,
    COUNT(*) as num_NFT,
    AVG(market_value) as AVG_WEI_value
FROM current_market_values
GROUP BY nft_address
ORDER BY 2 DESC
LIMIT 50;

-- Those with the highest average WEI value don't always have many NFT, 2nd highest has only 1
-- I don't think this is quite right, need to better understand WEI, not value...
SELECT 
    nft_address,
    COUNT(*) as num_NFT,
    AVG(market_value) as AVG_WEI_value
FROM current_market_values
GROUP BY nft_address
ORDER BY 3 DESC
LIMIT 50;

-- Number of distinct wallets - 9292
SELECT
    COUNT(DISTINCT nft_address) as Count
FROM current_market_values;

-- Number of distinct NFTs 1,179,659
SELECT
    COUNT(DISTINCT token_id) as num_NFT
FROM current_market_values;

-- Can be used to join WEI value to owners. Owner is key data here.
SELECT *
FROM current_owners
LIMIT 50;

-- address of NFT...? How join NFT address to token ID?
SELECT *
FROM nfts
LIMIT 50;

-- mint holding times is the length of time a NFT is held after minting before being moved.
-- transfer holding times is after that minting
SELECT *
FROM transfer_holding_times
LIMIT 50;

-- is this the NFT address or the wallet address. Look closer at format.
SELECT *
FROM transfer_statistics_by_address
LIMIT 50;

-- Finding length of string in transfer_statistics_by_address
SELECT LENGTH(address) FROM transfer_statistics_by_address;


