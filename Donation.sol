// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./PriceConverter.sol";

contract Donation{
    address public owner; // stores owners address
     uint256 public constant MINIMUM_USD = 50 * 1e18; // $50 in USD

    // track donation by address
    mapping(address => uint256) public donation;
    address[] public funders; // keep a track of all donors

    // event to log donation and withdrawals
    event DonationReceived(address indexed donor, uint256 amount);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    // Modifier to restrict access to owner-only function
    modifier onlyOwner{
        require(msg.sender == owner, "Only owner can withdraw funds");
        _;
    }

    // Constructor: Set the deployer as the owner
    constructor(){
        owner = msg.sender; // sets the deployer as the owner
    }

    receive() external payable {
        emit DonationReceived(msg.sender, msg.value);
    }

    // Payable function to accept donations
    function fund() public payable {
        require(msg.value > 0, "Donations must be greater than 0");
        donation[msg.sender] += msg.value; // Track the donation amount
        funders.push(msg.sender); // add the sender to the funders list
        emit DonationReceived(msg.sender, msg.value); // event to handle donation
    }


    // withdraw function-can be called by only the owner of the contract
    function withdraw() public onlyOwner{
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No Donations yet");


        // transfer funds to the owner
        (bool success,) = owner.call{value: contractBalance}("");
        require(success, "Withdrawal failed");

        emit FundsWithdrawn(owner, contractBalance); // log withdrawal

    }

    // get balance
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
}

