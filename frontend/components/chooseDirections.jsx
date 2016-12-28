import React from 'react';
import ReactDOM from 'react-dom';

class ChooseDirectionsForm extends React.Component {
  constructor() {
    super();

    this.state = {
      start: "",
      destination: ""
    };

    this.startStations =
      ['Embracadero', 'Montgomery St', 'Powell St', 'Civic Center'];

    this.handleStartChange = this.handleStartChange.bind(this);
    this.handleDestinationChange = this.handleDestinationChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  submitInputs() {
    // ajax post request to server
  }

  handleStartChange(event) {

  }

  handleDestinationChange(event) {

  }

  handleSubmit(event) {

  }

  render() {
    let startButtons =
      this.startStations.map((name, idx) => {
        let klass = this.state.start === name ? "selected" : "";
        return (<button className={klass} key={idx}>{name}</button>);
    });

    let destinationOptions = [];
    console.log(startButtons);
    return (
      <form className="choose-directions-form" >
        <h3>Where you travel from?</h3>
        {startButtons}
        <h3>What is your destination?</h3>
        {destinationOptions}
        <span>Do your magic and</span>
        <button onClick={this.handleSubmit}>Show me the options</button>
      </form>
    );
  }
}

export default ChooseDirectionsForm;
