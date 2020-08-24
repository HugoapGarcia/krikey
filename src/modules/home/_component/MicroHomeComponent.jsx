import React from "react";

import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Table from 'react-bootstrap/Table';
import ListGroup from 'react-bootstrap/ListGroup';
import Card from 'react-bootstrap/Card';

import Service from '../../../services/service';


class MicroHomeComponent extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            inputValue: '',
            user: [],
            authors: []
        }

        this.updateInputValue = this.updateInputValue.bind(this);
        this.handleRestify = this.handleRestify.bind(this);
        this.handleGetAllAuthors = this.handleGetAllAuthors.bind(this);
    }
    componentDidMount() {
        this.handleGetAllAuthors()
    }


    /**
     * @function handleGetAllAuthors
     * @description Get all Authors in database by sending request to end-point.
     */
    async handleGetAllAuthors() {
        let users = await new Service().fetch(`http://localhost:8080/api/authors`, { method: 'GET' });
        this.setState({
            authors: users.map((item, key) =>
                <ListGroup key={item.id} variant="flush">
                    <ListGroup.Item>{item.name}</ListGroup.Item>
                </ListGroup>
            )
        })
    }
    /**
     * @function updateInputValue
     * @param {*} evt 
     * @description Onchange handler to set current value form input field.
     */
    updateInputValue(evt) {
        this.setState({
            inputValue: evt.target.value
        });
    }

    /**
     * @function handleRestify
     * @description Async submit input value to Restify local server end-point.
     */
    async handleRestify(e) {

        let response = await new Service().fetch(`http://localhost:8080/api/${this.state.inputValue}`, { method: 'GET' });

        this.setState({
            user: [response].map((item, key) => {
                return item.id !== undefined
                    ?
                    <tr id={item.id} key={item.id}>
                        <th scope="row">{item.id}</th>
                        <th scope="row">{item.name}</th>
                        <th scope="row">{item.date_of_birth}</th>
                    </tr>
                    :
                    <tr id={item.id} key="error">
                        <th scope="row">Error</th>
                        <th scope="row">Error</th>
                        <th scope="row">Error</th>
                    </tr>
            })
        })
    }

    render() {
        return (
            <>
                <Container>
                    <h1 className="text-center">Krikey Code Challenge</h1>
                    <Form className="mt-4">
                        <Form.Group controlId="formBasicEmail">
                            <Form.Label>Enter Author Name : </Form.Label>
                            <Form.Control
                                value={this.state.inputValue} onChange={evt => this.updateInputValue(evt)}
                                type="text" placeholder="Enter Name" />
                        </Form.Group>
                        <Button variant="primary" onClick={(e) => this.handleRestify(e)}>
                            Submit
                         </Button>
                    </Form>
                </Container>
                <Container className="mt-4">
                    <h1 className="text-center">Status/Details User Response Table</h1>
                    <Table striped bordered hover className="mt-3">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Date of birth</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                this.state.user.length > 0
                                    ? this.state.user
                                    : <></>
                            }
                        </tbody>
                    </Table>
                </Container>
                <Container className="mt-5">
                    <h1 className="text-center">LIST OF USERS TO TEST IF SERVICE</h1>
                    <Card style={{ width: '18rem' }}>
                        {this.state.authors}
                    </Card>
                </Container>
            </>
        );
    }
}


export default MicroHomeComponent;