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
      ['Embracadero',
       'Montgomery St',
       'Powell St',
       'Civic Center'];

    this.destinationStations =
      ["12th St. Oakland City Center",
       "16th St. Mission (SF)",
       "19th St. Oakland",
       "24th St. Mission (SF)",
       "Ashby (Berkeley)",
       "Balboa Park (SF)",
       "Bay Fair (San Leandro)",
       "Castro Valley",
       "Civic Center (SF)",
       "Coliseum",
       "Colma",
       "Concord",
       "Daly City",
       "Downtown Berkeley",
       "Dublin/Pleasanton",
       "El Cerrito del Norte",
       "El Cerrito Plaza",
       "Embarcadero (SF)",
       "Fremont",
       "Fruitvale (Oakland)",
       "Glen Park (SF)",
       "Hayward",
       "Lafayette",
       "Lake Merritt (Oakland)",
       "MacArthur (Oakland)",
       "Millbrae",
       "Montgomery St. (SF)",
       "North Berkeley",
       "North Concord/Martinez",
       "Oakland Int'l Airport",
       "Orinda",
       "Pittsburg/Bay Point",
       "Pleasant Hill",
       "Powell St. (SF)",
       "Richmond",
       "Rockridge (Oakland)",
       "San Bruno",
       "San Francisco Int'l Airport",
       "San Leandro",
       "South Hayward",
       "South San Francisco",
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
    console.log(this.state);
    // ajax post request to server with inputs
    // go to options page on success
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
        <h3>Where you departing from?</h3>
        {startButtons}
        <h3>Where is your destination?</h3>
        <div className="select-destination">
          <select value={selectValue}
                  className={selectClass}
                  onChange={this.handleDestinationChange}>
            <option value="Select Station" disabled>Select Station</option>
            {destinationOptions}
          </select>
        </div>
        <span>Do your magic and</span>
        <button className="submit"
                onClick={this.handleSubmit}>
          Show me the options
        </button>
      </form>
    );
  }
}

export default ChooseDirectionsForm;
