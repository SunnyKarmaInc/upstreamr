import React from 'react';
import ReactDOM from 'react-dom';

class ChooseDirectionsForm extends React.Component {
  constructor() {
    super();

    this.state = {
      start: "Embracadero",
      destination: ""
    };

    this.startStations =
      ['Embracadero', 'Montgomery St', 'Powell St', 'Civic Center'];

    // this.handleStartChange = this.handleStartChange.bind(this);
    this.handleDestinationChange = this.handleDestinationChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  submitInputs() {
    // ajax post request to server
  }

  handleStartChange(station, event) {
    event.preventDefault();
    this.setState({ start: station });
  }

  handleDestinationChange(event) {

  }

  handleSubmit(event) {

  }

  render() {
    let startButtons =
      this.startStations.map((station, idx) => {
        let klass = this.state.start === station ? "selected" : "";
        return (<button className={klass}
                        key={idx}
                        onClick={this.handleStartChange.bind(this, station)}>
                  {station}
                </button>);
    });

    let destinationOptions = [];

    return (
      <form className="choose-directions-form" >
        <h3>Where you departing from?</h3>
        {startButtons}
        <h3>Where is your destination?</h3>
        {destinationOptions}
        <span>Do your magic and</span>
        <button onClick={this.handleSubmit}>Show me the options</button>
      </form>
    );
  }
}

export default ChooseDirectionsForm;
