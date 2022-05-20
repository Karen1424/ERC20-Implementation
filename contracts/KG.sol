// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC20.sol";

contract KG is ERC20 {
    
  constructor() ERC20("Coin","KG") {}

    uint private _tokenId = 9;

    function mint() external returns (uint) {
        _tokenId++;
        _mint(msg.sender, _tokenId);
        return _tokenId;
    }
}