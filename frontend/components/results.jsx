import React from 'react';

import DirectRoute from './directRoute';
import Upstream from './upstream';

class Results extends React.Component {
  constructor(props) {
    super(props);

    console.log(props);
    // this.state = {
    //   start: 'Embarcadero',
    //   destination: 'Rockridge',
    //   options: {
    //     fastest: {
    //       transfer: '',
    //       currentDeparture: '17:48',
    //       finalEta: '18:01',
    //       upsteamColor: '',
    //       upsteamDestination: '',
    //       downstreamColor: 'YELLOW',
    //       downstreamDestination: 'ptsb',
    //       transferArrival: '',
    //       transferDeparture: '',
    //       chanceOfStand: 'Most likely',
    //       chanceOfSeat: 'Likely'
    //     },
    //
    //     optimal: {
    //       transfer: 'Civic',
    //       currentDeparture: '17:26',
    //       finalEta: '18:05',
    //       upsteamColor: 'RED',
    //       upsteamDestination: 'mlbr',
    //       transferArrival: '17:30',
    //       transferDeparture: '17:42',
    //       downstreamColor: 'YELLOW',
    //       downstreamDestination: 'ptsb',
    //       chanceOfStand: 'Most likely',
    //       chanceOfSeat: 'Likely'
    //     },
    //
    //     guaranteedSeat: {
    //       transfer: 'UN Plaza',
    //       currentDeparture: '17:30',
    //       finalEta: '18:11',
    //       upsteamColor: 'RED',
    //       upsteamDestination: 'mlbr',
    //       transferArrival: '17:35',
    //       transferDeparture: '17:52',
    //       downstreamColor: 'YELLOW',
    //       downstreamDestination: 'ptsb',
    //       chanceOfStand: 'Most likely',
    //       chanceOfSeat: 'Likely'
    //     }
    //   }
    // };
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
