/*
* Original author: HG
* Latest contributio: HG
* Client: Krikey
* Project name: End-point service
* Project number: 1
* Main purpose: End-point controller heandler in charge of connect to specific database
* and return response base on query to search.
*/
const config = require('../config/config');
const errors = require('restify-errors');
const { Client } = require('pg');
var client = new Client(config.db);

client
    .connect()
    .then(() => console.log('connected'))
    .catch(err => console.error('connection error', err.stack))

/**
 * @function findUser
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 * @returns {Object} User found in JSON format or Error handler. 
 * @description Find specific user execution by name in database.
 */
exports.findUser = async (req, res, next) => {
    
    if (!req.params.name || req.params.name === '') { return next(new errors.BadRequestError()) }
    
    const query = {
        text: 'SELECT * from authors',
        types: {
            getTypeParser: () => val => val,
        },
    }
    // callback
    client.query(query, (err, result) => {
        if (err) {
            console.log(err.stack)
        } else {
            //console.log(res.rows)
            let item = result.rows.find(item => item.name === req.params.name);
            item !== undefined ? res.send(item) : res.send(new errors.NotFoundError());
            //console.log('data: ',item)
        }
    })
}

/**
 * @function getAllAuthors
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 * @description Return all existing user in database.
 */
exports.getAllAuthors = async (req, res, next) => {
    const query = {
        text: 'SELECT * from authors',
        types: {
            getTypeParser: () => val => val,
        },
    }
    client.query(query, (err, result) => {
        if (err) {
            console.log(err.stack)
        } else {
            //console.log(res.rows)
            result.rows.length > 0 ? res.send(result.rows) : res.send(new errors.NotFoundError());
        }
    })
}