// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Tyranid Obscure Bio-Fact Log
/// @notice Record obscure or surprising Tyranid biological facts and vote if they are interesting.
/// @dev Simple, safe, text-only contract.

contract TyranidBioFactLog {

    struct BioFact {
        string title;        // Short title of the fact
        string fact;         // The obscure Tyranid fact
        string sourceHint;   // Optional hint or reference (lore, codex, observation)
        address creator;     // Who recorded it
        uint256 interesting; // Interesting votes
        uint256 dull;        // Unremarkable votes
        uint256 createdAt;   // Timestamp
    }

    BioFact[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event BioFactRecorded(uint256 indexed id, string title, address indexed creator);
    event BioFactVoted(uint256 indexed id, bool interesting, uint256 interestingVotes, uint256 dullVotes);

    constructor() {
        logs.push(
            BioFact({
                title: "Example Bio-Fact (Fill your own below)",
                fact: "Describe an obscure Tyranid biological detail.",
                sourceHint: "Optional reference or observation.",
                creator: address(0),
                interesting: 0,
                dull: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordBioFact(
        string calldata title,
        string calldata fact,
        string calldata sourceHint
    ) external {
        require(bytes(title).length > 0, "Title required");

        logs.push(
            BioFact({
                title: title,
                fact: fact,
                sourceHint: sourceHint,
                creator: msg.sender,
                interesting: 0,
                dull: 0,
                createdAt: block.timestamp
            })
        );

        emit BioFactRecorded(logs.length - 1, title, msg.sender);
    }

    function voteBioFact(uint256 id, bool interesting) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        BioFact storage b = logs[id];

        if (interesting) {
            b.interesting += 1;
        } else {
            b.dull += 1;
        }

        emit BioFactVoted(id, interesting, b.interesting, b.dull);
    }

    function totalFacts() external view returns (uint256) {
        return logs.length;
    }
}
