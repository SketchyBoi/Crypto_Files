// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Trailblaze is ERC20Capped {

    constructor(uint256 cap) ERC20("Trailblaze", "TRZ") ERC20Capped(cap) {
        //for reference: cap should be 1000000000000000000000 for 1000
    }

    // constructor(address initialOwner, uint256 cap) ERC20("Trailblaze", "TRZ") ERC20Capped(cap) Ownable(initialOwner) {
    //     //for reference: cap should be 1000000000000000000000 for 1000
    // }

    function mintTokens(address to, uint256 amount) public {
        require(totalSupply() + amount <= cap(), "Cap exceeded");
        _mint(to, amount);
    }

    // function mintTokens(uint256 amount) public onlyOwner {
    //     _mint(owner(), amount);
    // }

    function issueTokens(address to, uint256 amount) public {
        _mint(to, amount);
    }
}