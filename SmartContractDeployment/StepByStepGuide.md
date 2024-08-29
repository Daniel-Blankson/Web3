# How to Deploy a Smart Contract to Sepolia (L1) and zkSync Sepolia (L2)

This guide will walk you through the process of creating and deploying a smart contract on two Ethereum networks: **Sepolia (L1)** and **zkSync Sepolia (L2)**. Sepolia is a testnet for Ethereum, while zkSync Sepolia is a layer 2 scaling solution for Ethereum, providing faster and cheaper transactions.

## Prerequisites

- Basic knowledge of Solidity and smart contract development.
- A web3 wallet like MetaMask installed in your browser.
- Some Sepolia testnet ETH in your wallet to cover deployment fees.

## Steps to Deploy a Smart Contract

### 1. Open the Remix Web IDE

Start by opening [Remix IDE](https://remix.ethereum.org/), an online Ethereum IDE that allows you to write, compile, and deploy smart contracts directly in your browser.

### 2. Set Up Your Project Directory

In Remix, clear your default directory and create a new folder named `"contracts"`. This is where your Solidity files will be stored. Note that for zkSync Sepolia deployment, it's crucial that your Solidity file is located in this `contracts` folder.

### 3. Create Your Solidity File

Inside the `contracts` folder, create a new Solidity file (e.g., `MyContract.sol`). This is where you'll write your smart contract code.

### 4. Add Licensing Information

At the top of your Solidity file, include the SPDX license identifier. This is a standard practice for open-source projects and helps with legal clarity.

```solidity
// SPDX-License-Identifier: MIT
```

The above line indicates that your code is licensed under the MIT license, a permissive free software license.

### 5. Write Your Smart Contract

Start by declaring your contract. In Solidity, a contract is similar to a class in object-oriented programming.

```solidity
pragma solidity ^0.8.0;

contract MyContract {
    // Contract logic goes here
}
```

### 6. Implement the Contract Logic

Here are some key Solidity types and structures you'll likely use when building your smart contract:

- **`uint256`**: The most common and largest unsigned integer type in Solidity, capable of storing values from `0` to `2^256 - 1`. It's used for calculations involving whole numbers.

  **Example:**
  ```solidity
  uint256 public totalSupply = 1000000;
  ```

- **`function`**: Functions encapsulate logic and can be called from within the contract or externally. Functions can have visibility specifiers like `public`, `private`, `internal`, or `external`.

  **Example:**
  ```solidity
  function getBalance() public view returns (uint256) {
      return totalSupply;
  }
  ```

- **`struct`**: A struct allows you to group multiple variables into a single custom data type. It's useful for representing complex objects like a user profile.

  **Example:**
  ```solidity
  struct User {
      string name;
      uint256 balance;
  }

  User public user = User("Alice", 100);
  ```

- **`mapping`**: A mapping is a key-value pair data structure, similar to hash maps in other programming languages. Mappings are particularly useful for associating data, such as tracking balances by user addresses.

  **Example:**
  ```solidity
  mapping(address => uint256) public balances;

  function setBalance(address _address, uint256 _balance) public {
      balances[_address] = _balance;
  }

  function getBalance(address _address) public view returns (uint256) {
      return balances[_address];
  }
  ```

- **`address`**: The `address` type is used to store Ethereum addresses, which can represent user accounts or smart contracts.

  **Example:**
  ```solidity
  address public owner;

  constructor() {
      owner = msg.sender;
  }
  ```

- **`modifier`**: Modifiers are used to alter the behavior of functions. They are often employed to enforce access control, such as restricting function execution to the contract owner.

  **Example:**
  ```solidity
  modifier onlyOwner() {
      require(msg.sender == owner, "Not the contract owner");
      _;
  }

  function changeOwner(address newOwner) public onlyOwner {
      owner = newOwner;
  }
  ```

- **`enum`**: An `enum` defines a user-defined type with a set of named values, which is useful for representing a choice between several possibilities.

  **Example:**
  ```solidity
  enum State { Waiting, Ready, Active }

  State public state;

  function activate() public {
      state = State.Active;
  }
  ```

### 7. Deploy to Sepolia (L1)

Once you've finished writing and testing your contract, you can deploy it to the Sepolia testnet:

1. Inject your web3 wallet (e.g., MetaMask) into Remix by selecting the "Injected Web3" environment from the environment dropdown.
2. Ensure that your MetaMask wallet is connected to the Sepolia testnet.
3. Click the "Deploy" button in Remix. This will prompt MetaMask to confirm the transaction.

After deployment, you'll receive the contract address, which you can use to interact with your contract on Sepolia.

### 8. Deploy to zkSync Sepolia (L2)

To deploy your contract on zkSync Sepolia:

1. Install the zkSync plugin from the Remix plugins panel.
2. Ensure that your Solidity version is compatible with zkSync's requirements.
3. Select the zkSync Sepolia environment from the bottom environment dropdown.
4. Deploy the contract similarly to how you did on Sepolia.

Again, you will receive a contract address that you can use to interact with the deployed contract on zkSync Sepolia.

### 9. Verify Deployment

In both instances (L1 and L2), you can verify your deployment by checking the respective blockchain explorers:

- For Sepolia: Use [Sepolia Etherscan](https://sepolia.etherscan.io/).
- For zkSync Sepolia: Use the [zkSync Sepolia Explorer](https://explorer.zksync.io/).

These explorers allow you to view the transaction details, contract address, and other relevant information related to your smart contract deployment.