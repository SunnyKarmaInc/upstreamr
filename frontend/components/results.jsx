import React from 'react';

import DirectRoute from './directRoute';
import Upstream from './upstream';

class Results extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    // console.log(this.props.results);

    return (
      <div className='results'>
        <DirectRoute start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.fastest} />
        <Upstream start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.optimal} />
        <Upstream start={this.props.results.start} dest={this.props.results.destination}
                     route={this.props.results.options.guaranteedSeat} />
      </div>
    );
  }
}

export default Results;
