// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Lottery{
    
    address public manager;
    address payable[] public participants;

    constructor(){
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 1, "Value must be 1 ether");
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager,"You are not manager");
        return address(this).balance;
    }

    function randomCreation() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.coinbase, block.timestamp, participants.length)));
    }

    function selectWinner() public {
        require(msg.sender == manager,"Manager can call this function");
        require(participants.length >= 3,"Participants must be equal or greater than 3");
        uint r = randomCreation();
        address payable winner;
        uint index = r % participants.length;
        winner = participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    }

}