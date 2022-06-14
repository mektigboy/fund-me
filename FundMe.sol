// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        require(msg.value >= minimumUsd, "Did not send enough!"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000
    }

    function getPrice() public {
        // ABI, address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e.

    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getConvertionRate() public {

    }
}
