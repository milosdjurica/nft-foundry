// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {}

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        // example:
        // parameter -> <svg width="1111px" height="1111" .....>
        // returns -> data:image/svg+xml;base64,eyJuYW1lIjoiTW9vZCBORlQiL.....
        string memory baseUrl = "data:image/svg+xml;base64";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        return string(abi.encodePacked(baseUrl, svgBase64Encoded));
    }
}
