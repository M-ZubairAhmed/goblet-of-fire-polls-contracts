var Election = artifacts.require("./Election.sol");

contract("Election", function (accounts) {
  let electionInstance;

  before(async () => {
    electionInstance = await Election.deployed();
  });

  it("contains all 3 candidates", async () => {
    const numberOfCandidatesInElection = await electionInstance.numberOfCandidates();

    assert.equal(numberOfCandidatesInElection, 3);
  });

  it("contains candidates with correct details", async () => {
    const electionCandidatesData = [
      {
        candidateID: 1,
        candidateName: "Cedric Diggory",
        candidateSchool: "Hogwarts School",
        votesCount: 0,
      },
      {
        candidateID: 2,
        candidateName: "Fleur Delacour",
        candidateSchool: "Beauxbatons Academy of Magic",
        votesCount: 0,
      },
      {
        candidateID: 3,
        candidateName: "Viktor Krum",
        candidateSchool: "Durmstrang Institute",
        votesCount: 0,
      },
    ];

    for (const candidate of electionCandidatesData) {
      const candidateInElection = await electionInstance.candidates(
        candidate.candidateID,
      );

      assert.equal(candidate.candidateID, candidateInElection[0]);
      assert.equal(candidate.candidateName, candidateInElection[1]);
      assert.equal(candidate.candidateSchool, candidateInElection[2]);
      assert.equal(candidate.votesCount, candidateInElection[3]);
    }
  });
});
