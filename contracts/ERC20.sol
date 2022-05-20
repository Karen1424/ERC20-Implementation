// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    // count of tokens
    uint private _totalSupply;

    string private _name;
    string private _symbol;

    constructor(string memory names, string memory symbols) {
        _name = names;
        _symbol = symbols;
    }

    function name() public view virtual returns(string memory) {
        return _name;
    }

    function symbol() public view virtual returns(string memory) {
        return _symbol;
    }

    function decimals() public view virtual returns(uint8) {
        return 18;
    }

    function totalSupply() public view virtual override returns(uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns(uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = msg.sender;
        require(_balances[owner] >= amount,"transfer amount exceeds balance");

        unchecked {
            _balances[owner] -= amount; 
        }
        _balances[to] += amount;
        
        return true;
    }

    function allowance(address owner, address spender) external virtual override view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = msg.sender;
        _allowances[owner][spender] = amount;
        return true;
    }

    function transferFrom(address from,address to,uint256 amount) public virtual override returns (bool) {

        transfer(to, amount);
        return true;
    }

    function _mint(address account, uint256 amount) internal virtual {

        _totalSupply += amount;
        _balances[account] += amount;
    }
}