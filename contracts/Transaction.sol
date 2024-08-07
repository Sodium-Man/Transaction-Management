// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Transaction {
    address public sender;
    address public receiver;
    uint public amount;

    event Transfer(address indexed _from, address indexed _to, uint _value);

    function sendTransaction(address _receiver) public payable {
        require(msg.value > 0, "Transaction value must be greater than 0");
        sender = msg.sender;
        receiver = _receiver;
        amount = msg.value;
        emit Transfer(sender, receiver, amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
