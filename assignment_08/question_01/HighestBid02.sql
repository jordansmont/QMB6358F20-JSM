/*
Question 1B
Calculate the highest bid for each auction and store with the associated Auction ID, winning Bid ID and Bidder ID
*/

.open AuctionsDatabase.db

.mode column
.headers on
.output HighestBid02.out

SELECT
BIDS.AUCTIONID AS AUCTIONID,
AUCTIONS.DATE AS DATE,
BIDS.BIDDERID AS BIDDERID,
MAX(BIDS.BID) AS HIGHESTBID
FROM BIDS
INNER JOIN AUCTIONS
ON AUCTIONS.AUCTIONID = BIDS.AUCTIONID

GROUP BY
BIDS.AUCTIONID;

.output stdout
