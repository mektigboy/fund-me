// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFounded;

    function fund() public payable {
        // require(msg.value.getConvertionRate() >= minimumUsd, "Did not send enough!"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFounded[msg.sender] = msg.value;
    }
}
