const config = {
  development: require('./development.config'),
  production: require('./production.config'),
  staging: require('./staging.config')
};

module.exports = config[process.env.NODE_ENV];