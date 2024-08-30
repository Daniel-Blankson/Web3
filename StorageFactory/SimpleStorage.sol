// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // stating our version

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

    // Added virtual for the function to be change through inheritance 
    function store(uint256 _favouriteNumber) public virtual {
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