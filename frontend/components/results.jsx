import React from 'react';

import DirectRoute from './directRoute';
import Upstream from './upstream';

class Results extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    console.log(this.props.results);

    return (
      <div className='results'>
        <p className='unlikely'>Most unlikely get a seat</p>
        <DirectRoute start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.fastest} />
        <p className='likely'>Most likely get a seat</p>
        <Upstream start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.optimal} />
        <p className='likely'>Most likely get a seat</p>
        <Upstream start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.guaranteedSeat} />
      </div>
    );
  }
}

export default Results;
