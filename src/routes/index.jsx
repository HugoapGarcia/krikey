import * as React from "react";

import {
    BrowserRouter as Router,
    Route,
    Switch
} from 'react-router-dom';

import Home from '../views/homeComponentView.jsx';

const Pages = (props) => {
    return (
        <Router>
            <Switch>
                <Route exact path="/" component={Home} />
            </Switch>
        </Router>
    );
};

export default Pages;