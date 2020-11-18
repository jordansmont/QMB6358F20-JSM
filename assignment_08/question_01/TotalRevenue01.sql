/*
Question 1C
Join volumes from auctions to calculate total revenue for each auction and output AuctionID, Date, TotalRevenue, and BidderID for each auction
*/

/* OPTION 1 - WOULD NEED TO TWEAK TO GET TABLE TO POPULATE AFTER BEING CREATED

CREATE TABLE TotalRevenue
AS SELECT
Auctions.AuctionID,
Auctions.Date,
MAX(Bids.Bid) * Auctions.Volume AS TotalRevenue,
Bids.BidderID
FROM
auctions AS Auctions
INNER JOIN bids AS Bids
ON Auctions.AuctionID = Bids.AuctionID
GROUP BY
Auctions.AuctionID;
*/

SELECT
Auctions.AuctionID,
Auctions.Date,
MAX(Bids.Bid) * Auctions.Volume AS TotalRevenue,
Bids.BidderID
FROM
auctions AS Auctions
INNER JOIN bids AS Bids
ON Auctions.AuctionID = Bids.AuctionID
GROUP BY
Auctions.AuctionID;
