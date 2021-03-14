// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.7.4;

contract HelloAuction {

    uint256 expirationDate;
    uint256 startingPrice;
    address highestBidAddr;
    uint256 highestBidAmount;

    constructor(uint256 _startingPrice) {
        expirationDate = block.timestamp + 3 days;
        startingPrice = _startingPrice;
        highestBidAmount = _startingPrice;
    }

    event NewBid(address addr, uint256 amount);
    event FailedBid(address addr, uint256 amount);
    event AuctionDone(address addr, uint256 amount);

    function placeBid() public payable {
        require(block.timestamp <= expirationDate);
        if (msg.value < highestBidAmount) { 
            emit NewBid(msg.sender, msg.value);   
        } else {
            emit FailedBid(msg.sender, msg.value);
        }

    }

    function endAuction() private {
        require(block.timestamp > expirationDate);
        emit AuctionDone(highestBidAddr, highestBidAmount);
    }

}