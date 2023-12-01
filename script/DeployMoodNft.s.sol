// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/svg/sad.svg");
        string memory happySvg = vm.readFile("./images/svg/happy.svg");
        // console.log(sadSvg);
        // console.log(happySvg);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

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
