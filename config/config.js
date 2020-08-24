
(function() {
    var appConfig = {
        name: "[krikey] API",
        hostname: "http://localhost",
        version: "1.0.0",
        env: process.env.NODE_ENV || 'development',
        port: process.env.PORT || 8080,
        portAPP: process.env.PORT || 3000,
        db: {
            user:"postgres",
            host:"localhost",
            database:"krikey",
            password:"hugogarcia",
            port:"5432"
        }
    }
    if (typeof module !== undefined && typeof module.exports !== undefined) {
        module.exports = appConfig;
    } else {
        window.appConfig = appConfig;
    }
})();