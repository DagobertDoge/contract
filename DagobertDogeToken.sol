// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.2.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.2.0/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.2.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.2.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.2.0/token/ERC20/extensions/draft-ERC20Permit.sol";

contract DagobertDoge is ERC20, ERC20Snapshot, Ownable, Pausable, ERC20Permit {
    constructor()
        ERC20("DagobertDoge", "DAGOBERTDOGE")
        ERC20Permit("DagobertDoge")
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
