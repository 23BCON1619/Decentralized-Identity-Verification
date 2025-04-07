
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityVerification {

    struct Identity {
        string name;
        uint256 birthDate;
        string nationality;
        string documentHash; // Hash of the identity document, such as passport or ID card
        bool isVerified; // Whether the identity is verified by the trusted authority
    }

    address public owner;

    mapping(address => Identity) public identities; // Mapping of user address to their identity
    mapping(address => bool) public isVerified; // Mapping to track verification status of users

    // Event emitted when an identity is registered
    event IdentityRegistered(address indexed user, string name);
    
    // Event emitted when an identity is verified
    event IdentityVerified(address indexed user, bool verified);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only
