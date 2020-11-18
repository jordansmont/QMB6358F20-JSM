/*
Question 1A
Calculate the highest bid for each auction and store with the associated Auction ID
*/

.mode column
.headers on
.output HighestBid01.out

SELECT
AUCTIONS.AUCTIONID,
MAX(BIDS.BID) AS HIGHESTBID
FROM
AUCTIONS AS AUCTIONS
INNER JOIN BIDS AS BIDS
ON AUCTIONS.AUCTIONID = BIDS.AUCTIONID
GROUP BY
AUCTIONS.AUCTIONID;

.output stdout
