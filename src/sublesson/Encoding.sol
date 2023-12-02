// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Encoding {
    function combineStrings() public pure returns (string memory) {
        // combining bytes of those 2 strings, and then casting bytes into string with string() around it
        // this does the same thing as string.concat("Hello ", "there");
        return string(abi.encodePacked("Hello ", "there!"));
    }

    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns (bytes memory) {
        return abi.encode("Encoded string");
    }

    function encodeStringPacked() public pure returns (bytes memory) {
        // encodePacked is much more gas efficient, but less precise
        bytes memory someString = abi.encodePacked(
            "Encoded string, but 'compresses it'!!!"
        );

        return someString;
    }
}
