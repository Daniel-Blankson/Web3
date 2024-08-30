// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { SimpleStorage } from "./SimpleStorage.sol";

// AddFiveStorage has the properties of SimpleStorage through inheritance
contract AddFiveStorage is SimpleStorage {
    function store(uint256 _newNumber) public override {
        MyFavouriteNumber = _newNumber + 5;
    }
}