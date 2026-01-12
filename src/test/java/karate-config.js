function fn() {
  var env = karate.env;
  var config = { env : env};

  config.baseUrl = "https://bookstore.demoqa.com"
  karate.log('karate.env system property was:', env);

  return config;
}