import React from 'react';

import DirectRoute from './directRoute';

class Results extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className='results'>
        <p className='unlikely'>Most unlikely get a seat</p>
        <DirectRoute start='Embarcadero' dest='Rockridge'
                 downstream='25 min' eta='6:35 pm'/>
      </div>
    );
  }
}

export default Results;
