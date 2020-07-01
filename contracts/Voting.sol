pragma solidity ^0.5.0;

import "./GSNRecipient.sol";


/*
 * this contract is modified from the sample found in openzeppelin's GSN tutorial
 */
contract Voting is GSNRecipient {
    string public subject = "Do you think GSN is awesome?";
    uint256 public totalYes;
    uint256 public totalNo;
    mapping(address => uint8) public votes;

    function voteYes() public {
        require(votes[_msgSender()] == 0, "this account already voted");
        votes[_msgSender()] = 1;
        totalYes++;
    }

    function voteNo() public {
        require(votes[_msgSender()] == 0, "this account already voted");
        votes[_msgSender()] = 2;
        totalNo++;
    }

    function acceptRelayedCall(
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    ) external view returns (uint256, bytes memory) {
        return _approveRelayedCall();
    }

    // No pre or post processing, leave _preRelayedCall and _postRelayedCall empty
    function _preRelayedCall(bytes memory context) internal returns (bytes32) {}

    function _postRelayedCall(
        bytes memory context,
        bool,
        uint256 actualCharge,
        bytes32
    ) internal {}
}
