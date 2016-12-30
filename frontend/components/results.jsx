import React from 'react';

import DirectRoute from './directRoute';

class Results extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      start: 'Embarcadero',
      destination: 'Rockridge',
      options: {
        fastest: {
          transfer: '',
          currentDeparture: '17:48',
          finalEta: '18:01',
          upsteamColor: '',
          upsteamDestination: '',
          downstreamColor: 'yellow',
          downstreamDestination: 'ptsb',
          transferArrival: '',
          transferDeparture: '',
          chanceOfStand: 'Most likely',
          chanceOfSeat: 'Likely'
        },

        optimal: {
          transfer: 'Civic',
          currentDeparture: '17:26',
          finalEta: '18:05',
          upsteamColor: 'red',
          upsteamDestination: 'mlbr',
          transferArrival: '17:30',
          transferDeparture: '17:42',
          downstreamColor: 'yellow',
          downstreamDestination: 'ptsb',
          chanceOfStand: 'Most likely',
          chanceOfSeat: 'Likely'
        },

        guaranteedSeat: {
          transfer: 'UN Plaza',
          currentDeparture: '17:30',
          finalEta: '18:11',
          upsteamColor: 'red',
          upsteamDestination: 'mlbr',
          transferArrival: '17:35',
          transferDeparture: '17:52',
          downstreamColor: 'yellow',
          downstreamDestination: 'ptsb',
          chanceOfStand: 'Most likely',
          chanceOfSeat: 'Likely'
        }
      }
    };
  }

  render() {

    return (
      <div className='this.state'>
        <p className='unlikely'>Most unlikely get a seat</p>
        <DirectRoute start={this.state.start} dest={this.state.destination}
                     options={this.state.options}/>
      </div>
    );
  }
}

export default Results;
