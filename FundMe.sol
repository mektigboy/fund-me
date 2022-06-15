// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18; // 1 * 10 ** 18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFounded;

    function fund() public payable {
        require(msg.value.getConvertionRate() >= minimumUsd, "Did not send enough!");
        funders.push(msg.sender);
        addressToAmountFounded[msg.sender] += msg.value;
    }

    function withdraw() public {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFounded[funder] = 0;
        }

        // Reset "funders" array.
        funders = new address[](0); // New array of addresses with 0 elements.

        // Transfer
        // Where msg.sender = address.
        // And payable(msg.sender) = payable address.
        payable(msg.sender).transfer(address(this).balance);

        // Send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed.");
    }
}
