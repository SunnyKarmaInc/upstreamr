import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './components/navbar';
import ChooseDirectionsForm from './components/chooseDirections';
import Results from './components/results';


class Upstreamr extends React.Component {
  constructor() {
    super();

    this.state = { input: false };
  }

  displayResults(results) {
    this.setState({ input: true, results });
  }

  render() {
    if (this.state.input === false) {
      return (
        <div>
          <Navbar />
          <ChooseDirectionsForm displayResults={this.displayResults.bind(this)}/>
        </div>);
    } else {
      return (
        <div>
          <Navbar />
          <Results results={this.state.results}/>
        </div>);
    }
  }
}

export default Upstreamr;
