const adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
    it('should be able to adopt pet', async () => {
        const instance = await adoption.deployed();
        const expectedPetId = 8;
        const returnedId = await instance.adopt.call(expectedPetId);

        assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    });
});