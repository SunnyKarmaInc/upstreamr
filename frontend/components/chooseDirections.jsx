import React from 'react';
import ReactDOM from 'react-dom';

class ChooseDirectionsForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      start: "Embarcadero",
      destination: "",
      message: ""
    };

    this.startStations =
      ['Embarcadero',
       'Montgomery St.',
       'Powell St.',
       'Civic Center'];

    this.destinationStations =
      ["12th St. Oakland City Center",
       "19th St. Oakland",
       "Ashby (Berkeley)",
       "Bay Fair (San Leandro)",
       "Castro Valley",
       "Coliseum",
       "Concord",
       "Downtown Berkeley",
       "Dublin/Pleasanton",
       "El Cerrito del Norte",
       "El Cerrito Plaza",
       "Fremont",
       "Fruitvale (Oakland)",
       "Hayward",
       "Lafayette",
       "Lake Merritt (Oakland)",
       "MacArthur (Oakland)",
       "North Berkeley",
       "North Concord/Martinez",
       "Oakland Int'l Airport",
       "Orinda",
       "Pittsburg/Bay Point",
       "Pleasant Hill",
       "Richmond",
       "Rockridge (Oakland)",
       "San Leandro",
       "South Hayward",
       "Union City",
       "Walnut Creek",
       "West Oakland"];

    // this.handleStartChange = this.handleStartChange.bind(this);
    this.handleDestinationChange = this.handleDestinationChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleStartChange(station, event) {
    event.preventDefault();
    this.setState({ start: station });
  }

  handleDestinationChange(event) {
    event.preventDefault();
    this.setState({ destination: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();

    if (this.state.destination === "") {
      this.setState({ message: "Please select your destination" });
    } else {
      this.setState({ message: "Sending request.." });
      this.loadResults();
    }
  }

  loadResults() {
    const start = this.state.start;
    const end = this.state.destination;
    const request = new XMLHttpRequest();
    const baseUrl = `${window.location.href}directions`;
    const url = `${baseUrl}?start=${start}&end=${end}`;

    request.open('GET', url, true);

    request.onload = () => {
      if (request.status >= 200 && request.status < 400) {
        // Success!
        // console.log(request.responseText);
        const resp = JSON.parse(request.responseText);
        if (typeof resp.options.fastest === 'string') {
          this.setState({ message: resp.options.fastest });
        } else {
          this.props.displayResults(resp);
        }
      } else {
        // We reached our target server, but it returned an error
      }
    };

    request.onerror = function() {
      // There was a connection error of some sort
    };

    request.send();
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

    let destinationOptions = this.destinationStations.map(station => (
      <option value={station} key={station}>{station}</option>
    ));

    let selectValue, selectClass;

    if (this.state.destination === "") {
        selectValue = "Select Station";
        selectClass = "empty";
      } else {
        selectValue = this.state.destination;
        selectClass = "selected";
      }
    return (
      <form className="choose-directions-form" >
        <h3>Departure Station</h3>
        {startButtons}
        <h3>Destination Station</h3>
        <div className="select-destination">
          <select value={selectValue}
                  className={selectClass}
                  onChange={this.handleDestinationChange}>
            <option value="Select Station" disabled>Select Station</option>
            {destinationOptions}
          </select>
        </div>
        <span className="message">{this.state.message}</span>
        <span>Do your magic and</span>
        <button className="submit"
                onClick={this.handleSubmit}>
          Find me a seat!
        </button>
      </form>
    );
  }
}

export default ChooseDirectionsForm;
