/*
* Original author: HG
* Latest contributio: HG
* Client: Krikey
* Project name: End-point service
* Project number: 1
* Main purpose: Run Restify server, connect to Postgres database, use Restify api 
* for service.
*/

(function () {
    // Get dependencies
    const config = require('./config/config');
    const restify = require('restify');
    const corsMiddleware = require('restify-cors-middleware');

    const authorsController = require('./controller/authotsController');

    /**
     * Header request
     */
    const cors = corsMiddleware({
        preflightMaxAge: 5, //Optional
        origins: ['*']
    })


    /**
     * Initilalize server
     */
    const server = restify.createServer({
        name: config.name,
        version: config.version
    });

    server.pre((req, res, next) => {
        console.info(`${req.method} - ${req.url}`);
        return next()
    })

    /**
     * Middleware
     */
    server.use(restify.plugins.acceptParser(server.acceptable));
    server.use(restify.plugins.queryParser());
    server.use(restify.plugins.bodyParser());
    server.pre(cors.preflight)
    server.use(cors.actual)

    /**
     * Routes
     */
    server.get('/api/:name', authorsController.findUser);
    server.get('/api/authors', authorsController.getAllAuthors)

    server.listen(config.port, function () {
        console.log('%s listening at %s', server.name, server.url);
    });

})();