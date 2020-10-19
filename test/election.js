var Election = artifacts.require("./Election.sol");

contract("Election", function (accounts) {
  let electionInstance;

  it("stores 2 election candidate", async () => {
    electionInstance = await Election.deployed();
    const numberOfCandidatesInElection = await electionInstance.numberOfCandidates();

    assert.equal(numberOfCandidatesInElection, 2);
  });

  it("saved candidates with correct candidate details", async () => {
    electionInstance = await Election.deployed();

    const electionCandidatesData = [
      {candidateID: 1, candidateName: "KCR", voteCount: 0},
      {candidateID: 2, candidateName: "YRS", voteCount: 0},
    ];

    for (const candidate of electionCandidatesData) {
      const candidateInElection = await electionInstance.candidates(
        candidate.candidateID,
      );

      assert.equal(candidate.candidateID, candidateInElection[0]);
      assert.equal(candidate.candidateName, candidateInElection[1]);
      assert.equal(candidate.voteCount, candidateInElection[2]);
    }
  });
});
