// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {
  // Model of the candidate
  struct Candidate {
    uint256 candidateID;
    string candidateName;
    uint256 voteCount;
  }

  // Persists candidates in storage
  mapping(uint256 => Candidate) public candidates;

  // To keep track of list of candidates in election
  uint256 public numberOfCandidates;

  constructor() public {
    addCandidate("KCR");
    addCandidate("YRS");
  }

  function addCandidate(string memory _candidateName) private {
    numberOfCandidates++;
    candidates[numberOfCandidates] = Candidate(
      numberOfCandidates,
      _candidateName,
      0
    );
  }
}
