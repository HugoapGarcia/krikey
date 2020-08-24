### INSTALL APPLICATION
 - Install PostgreSQL and select depending on env you are working
    Windows :
        url : https://www.postgresql.org/download/
    Mac OS :
        url: https://postgresapp.com/


 - clone repository
    url :

  ### DB
  - Import DB
    cd /krikey/db
    ### Run command
        \i /Dir/krikey/db/krikey.sql;   
          
    ### Install node_modules
 - cd /krikey
    - yarn install or npm install

   ### Run client application development mode
    - yarn start  or npm run start  
   ### Run client application production mode Mac os
    - yarn start:prod or npm run start:prod
   ### Run server signaling end-point 
    - yarn server



### Learn More *****************

## Note: Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `yarn start:prod`

Runs the app in the production mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### HOW TO RUN SERVER END-POINT LISTENER 

### `yarn server`
Runs server in the production mode.<br />
Open [http://localhost:8080](http://localhost:8080).
***Note:
    End-point services routes listners

    GET http://localhost:8080/api/'name'







