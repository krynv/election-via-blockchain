const Election = artifacts.require("../contracts/Election.sol");

contract("Election", (accounts) => {

    let electionInstance;

    it("initialises with two candidates", () => {
        return Election.deployed().then((instance) => {
            return instance.candidatesCount();
        }).then((count) => {
            assert.equal(count, 2);
        });
    });

    it("initialises the candidates with the correct values", () => {
        return Election.deployed().then((instance) => {
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then((candidate) => {
            assert.equal(candidate[0], 1, "contains the correct id");
            assert.equal(candidate[1], "Barry Chuckle", "contains the corrent name");
            assert.equal(candidate[2], 0, "contains the correct vote count");
            return electionInstance.candidates(2);
        }).then((candidate) => {
            assert.equal(candidate[0], 2, "contains the correct id");
            assert.equal(candidate[1], "Paul Chuckle", "contains the corrent name");
            assert.equal(candidate[2], 0, "contains the correct vote count");
        });
    });
});