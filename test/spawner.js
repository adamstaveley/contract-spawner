const Spawner = artifacts.require('./Spawner.sol');

contract('Spawner', function(accounts) {

  let spawner;

  beforeEach(async () => {
    spawner = await Spawner.new();
  });

  it('should spawn new erc20 contracts', async function() {
    await spawner.newToken(accounts[1], "poopcoin", "POO", 10);
    const addr = await spawner.getTokenAddress({ from: accounts[1] });
    
    return new Promise((resolve, reject) => {
      const event = spawner.TokenCreation({}, (err, res) => {
        assert.equal(res.args.location, addr);
        event.stopWatching();
        resolve();
      });
    });
  });

});
