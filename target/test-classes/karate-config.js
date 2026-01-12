function fn() {
  var env = karate.env;
  if (!env) {
      env = 'qa';
    }
  var config = { env : env};
  config.baseUrl = "https://bookstore.demoqa.com"
  karate.log('karate.env system property was:', env);
  //karate.configure('retry', {count: 10, interval: 5000});

  return config;
}