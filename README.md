# Lottery Contract

## About Contract
This is a simple Ethereum smart contract for a lottery system. Participants can send 1 ether to the contract, and when the manager decides to select a winner, the contract will randomly pick a participant from the list of participants and transfer the total balance of the contract to them.

### Contract Details:

- Solidity version: >=0.8.0 < 0.9.0
- License: MIT

#### Functions:

##### receive()
- The receive() function is a special function in Solidity that is called when the contract receives ether. In this contract, participants can send 1 ether to the contract using this function. If the value of the transaction is not 1 ether, the function will throw an error.

##### getBalance():
- The getBalance() function is a public view function that can be called by the manager to check the current balance of the contract.

##### randomCreation():
- The randomCreation() function generates a random number by hashing the current block's coinbase address, timestamp, and the number of participants. It returns the generated number as a uint.

##### selectWinner():
- The selectWinner() function can be called only by the manager. It checks whether the number of participants is greater than or equal to 3. If so, it generates a random number using the randomCreation() function, selects a winner based on the index generated, transfers the total balance of the contract to the winner's address, and resets the list of participants to an empty list.

### Usage:
To use this contract, the manager needs to deploy the contract to the Ethereum blockchain and provide their address as the initial manager. Participants can then send 1 ether to the contract address using any Ethereum wallet. When the manager decides to select a winner, they can call the selectWinner() function to randomly select a winner and transfer the balance of the contract to them.

##### Note: This contract is intended for educational and experimental purposes only and should not be used for any actual lottery system without complete satisfaction.
