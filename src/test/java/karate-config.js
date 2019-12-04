function() {
//function fn () {
  var env = karate.env; // get java system property 'karate.env'
  karate.configure('ssl',true)
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa'; // a custom 'intelligent' default
  }

  var config = {
      env: env,
  	myVarName: 'someValue'
    }
 // var config = { // base config JSON
  //  appId: 'my.app.id',
  //  appSecret: 'my.secret',
  //  someUrlBase: 'https://some-host.com/v1/auth/',
  //  anotherUrlBase: 'https://another-host.com/v1/'
 // };
  if (env == 'stage') {
    // over-ride only those that need to be
    //config.someUrlBase = 'https://api.fitchconnect-stg.com/v1/oauth/token';
  }else if (env == 'qa') {
       // over-ride only those that need to be
       //config.someUrlBase = 'https://api.fitchconnect-qa.com/v1/oauth/token';
  } else if (env == 'dev') {
        // over-ride only those that need to be
        //config.someUrlBase = 'https://api.fitchconnect-dev.com/v1/oauth/token';
            }else if (env == 'e2e') {
    //config.someUrlBase = 'https://e2e-host/v1/auth';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}