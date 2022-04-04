-- Trying to figure out which tables might be the most interesting to work with.
-- Also would like to separate larger tables into half for training and testing datasets.

-- SQLite does not use TOP, instead uses LIMIT
-- Small simple table aggregating bins for number of holds for lengths of time.
SELECT days, num_holds
FROM mint_holding_times;

-- May want to join on NFT_ADDRESS for MARKET_VALUE
-- TOKEN_ID is the specific NFT identifier, a wallet (NFT_ADDRESS) can have multiple NFTs in it.
-- Running into integer overflow error which is new for me, associated with SUM, too many numbers in market value
-- switched to AVG.
SELECT 
nft_address,
COUNT(*) as num_NFT,
AVG(market_value) as AVG_value
FROM current_market_values
GROUP BY nft_address
ORDER BY 2 DESC
LIMIT 50;
