
export default class Service {

    fetch(url, options) {
        const headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        };

        // console.log('OPTIONS', options);
        // console.log('Header', headers);
        // console.log('Domain3:', url);

        return fetch(url, {
            method: options.method,
            headers: headers,
            body: JSON.stringify(options.body)
        })
            .then(this._checkStatus)
            .then(response => {
                return response.json();
            })
            .catch(error => error)
    }

    _checkStatus(response) {
        // raises an error in case response status is not a success
        if (response.status >= 200 && response.status < 300) { // Success status lies between 200 to 300
            return response;
        } else {
            var error = new Error(response.statusText);
            error.response = response;
            throw error;
        }
    }
}