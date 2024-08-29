// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // stating our version, for zkSync it's only compatible with 0.8.24

contract SimpleStorage {
    // favouriteNumber gets initialised to - if no value is given
    uint256 MyFavouriteNumber; // 0

    // uint256[] listOfFavouriteNumbers;
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople; // []

    // chelsea -> 232
    mapping(string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favouriteNumber) public {
        MyFavouriteNumber = _favouriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256) {
        return MyFavouriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}

// Address of the contract on Sepolia testnet 0xdC5F9AD68fad7239075f3D53763B99d4b5a55777 