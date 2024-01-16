// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./Helper.sol";
import {ProgrammableTokenTransfers} from "../src/ProgrammableTokenTransfers.sol";

contract DeployProgrammableTokenTransfers is Script, Helper {
    function run(SupportedNetworks network) external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        (address router, , , ) = getConfigFromNetwork(network);

        ProgrammableTokenTransfers programmableTokenTransfers = new ProgrammableTokenTransfers(
                router
            );

        console.log(
            "ProgrammableTokenTransfers contract deployed on ",
            networks[network],
            "with address: ",
            address(programmableTokenTransfers)
        );

        vm.stopBroadcast();
    }
}