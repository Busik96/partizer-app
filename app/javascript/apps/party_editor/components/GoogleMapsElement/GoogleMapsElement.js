import React from 'react'

const GoogleMapsElement = ({longitude, latitude}) => {
  const googleURL = () => (
    `https://maps.google.com/maps?q=${latitude}%20${longitude}&t=&z=13&ie=UTF8&iwloc=&output=embed`
  );

  return (
    <div className="mapouter">
      <div className="gmap_canvas">
        <iframe
          frameBorder="0"
          height="100%"
          id="gmap_canvas"
          marginHeight="0"
          marginWidth="0"
          scrolling="no"
          src={googleURL()}
          width="100%"
        />
      </div>
    </div>
  );
}

export default GoogleMapsElement;
