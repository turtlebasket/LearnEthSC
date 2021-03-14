// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.7.4;
// pragma solidity >=0.7.4;

contract HelloCounter {
    
    // Public variable of type unsigned int to keep the number of counts
    uint256 public count = 0;

    // Function that increments our counter
    function increment() public {
        count += 1;
    }

    // Not necessary getter to get the count value
    function getCount() public view returns (uint256) {
        return count;
    }

}