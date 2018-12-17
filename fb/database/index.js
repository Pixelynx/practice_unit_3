const pgp = require('pg-promise');
const db = pgp('postgres://localhost:5432/fb');

module.exports = { db };
