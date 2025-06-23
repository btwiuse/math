// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.26;

import {IMath} from "./IMath.sol";
import {IMirror} from "gear/ethexe/contracts/src/IMirror.sol";
import {ScaleCodec} from "gear/ethexe/contracts/src/ScaleCodec.sol";

contract Math is IMath {
    modifier onlyMirror() {
        require(msg.sender == mirror, "not mirror contract");
        _;
    }

    address public mirror;

    function initialize(address _mirror) external {
        require(mirror == address(0), "Already initialized");
        mirror = _mirror;
    }


    function onMessageSent(bytes32 id, address destination, bytes calldata payload, uint128 value) public onlyMirror {
        emit OnMessageEvent(payload, id, destination, value);
    }

    function onReplySent(address destination, bytes calldata payload, uint128 value, bytes32 replyTo, bytes4 replyCode) public onlyMirror {
        if (replyCode[0] != 0x00) {
            emit ErrorReply(payload, destination, value, replyTo, replyCode);
            return;
        }
        emit OnReplyEvent(payload, destination, value, replyTo, replyCode);
    }


    function sendMessage(bytes memory _payload, uint128 _value) public payable {
        IMirror(mirror).sendMessage(_payload, _value);
    }
}
