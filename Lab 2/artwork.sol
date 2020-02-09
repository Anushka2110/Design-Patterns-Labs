pragma solidity ^0.5.16;

import "./ERC721Token.sol";

contract Artwork is ERC721Token{
    uint artHex;
    bool sellable;
    event owner_change (string, address);
    constructor(uint _artHex, address _owner) public{
        owner=_owner;
        artHex=_artHex;
    }
    
    function artOwner() public view returns(address) {
        return (owner);  
    }
    
    function changeOwnership(address _newOwner) onlyOwner() public payable{
        require(sellable,"Error: Artwork not for sell");
        this.safeTransferFrom(owner,_newOwner,artHex);
    }
    
    function setSellable(bool _sellable) onlyOwner public {
        sellable= _sellable;
    }
 
}