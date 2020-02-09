pragma solidity ^0.5.16;

import "./ERC721Token.sol";
import "./Artwork.sol";

contract Artist is ERC721Token{
    
    mapping(uint=>address)  artworks;
    
    
      constructor(string memory _name) public{
        owner=msg.sender;
    }
    
    function addArt(uint artHex) public onlyOwner() returns (Artwork) {
       Artwork artwork= new Artwork(artHex, owner);
       artworks[artHex] = artwork.getAddress();
       return artwork;
    }
    
    function isMyArtwork(uint artHex) public onlyOwner() view returns(bool) {
   //     require(artworks[artHex] != bytes32(0),"Error: Invalid artwork");
        return true; 
    }
    
    
}